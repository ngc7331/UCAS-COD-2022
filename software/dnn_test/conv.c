#include "perf_cnt.h"
#include "printf.h"
#include "trap.h"
#include "mul.h"
#include "div.h"

#define FRAC_BIT 10

#define RD_ADDR 135106448
#define RD_SIZE_D0 1
#define RD_SIZE_D1 1
#define RD_SIZE_D2 28
#define RD_SIZE_D3 28

#define WEIGHT_ADDR 134217728
#define WEIGHT_SIZE_D0 20
#define WEIGHT_SIZE_D1 1
#define WEIGHT_SIZE_D2 5
#define WEIGHT_SIZE_D3 5

#define WR_ADDR 135108240
#define WR_SIZE_D0 1
#define WR_SIZE_D1 20
#define WR_SIZE_D2 12
#define WR_SIZE_D3 12

#define KERN_ATTR_CONV_PAD 0
#define KERN_ATTR_CONV_STRIDE 1
#define KERN_ATTR_POOL_PAD 0
#define KERN_ATTR_POOL_KERN_SIZE 2
#define KERN_ATTR_POOL_STRIDE 2

//MMIO register address of DNN accelerator
#define GPIO_START_ADDR    0x60030000
#define GPIO_DONE_ADDR     0x60030008

struct size_vec4
{
	unsigned d0;
	unsigned d1;
	unsigned d2;
	unsigned d3;
};

struct mem_addr
{
	unsigned rd_addr;
	unsigned weight_addr;
	unsigned wr_addr;
};

int mul(short a, short b)
{
#ifndef USE_MUL
	int ans = mul_ll(a, b);
#else
	int ans = a * b;
#endif
	return ans;
}

struct mem_addr addr = {RD_ADDR, WEIGHT_ADDR, WR_ADDR};
struct size_vec4 rd_size = {RD_SIZE_D0, RD_SIZE_D1, RD_SIZE_D2, RD_SIZE_D3};
struct size_vec4 wr_size = {WR_SIZE_D0, WR_SIZE_D1, WR_SIZE_D2, WR_SIZE_D3};
struct size_vec4 weight_size = {WEIGHT_SIZE_D0, WEIGHT_SIZE_D1, WEIGHT_SIZE_D2, WEIGHT_SIZE_D3};

struct size_vec4 conv_size;

extern char _binary_data_result_bin_start[];
extern char _binary_data_result_bin_size[];

void convolution()
{
	short *in = (short *)addr.rd_addr;
	short *weight = (short *)addr.weight_addr;
	short *out = (short *)addr.wr_addr;

	unsigned output_offset = 0;
	unsigned input_offset = 0;

	unsigned input_fm_w = rd_size.d3;
	unsigned input_fm_h = rd_size.d2;

	unsigned pad = KERN_ATTR_CONV_PAD;
	unsigned pad_len = pad << 1;

	unsigned conv_out_w = rd_size.d3 - weight_size.d3 + pad_len;
	unsigned conv_out_h = rd_size.d2 - weight_size.d2 + pad_len;

	unsigned stride = KERN_ATTR_CONV_STRIDE;

	conv_out_w = div(conv_out_w, stride);
	conv_out_h = div(conv_out_h, stride);

	conv_out_w++;
	conv_out_h++;

	conv_size.d0 = wr_size.d0;
	conv_size.d1 = wr_size.d1;
	conv_size.d2 = conv_out_h;
	conv_size.d3 = conv_out_w;

	//TODO: Please add your implementation here
    #ifndef USE_MUL
    in += input_offset;
    out += output_offset;
    // caculate frame size to reduce duplicate calculations
    unsigned in_fm_size = mul(rd_size.d2, rd_size.d3);
    unsigned weight_fm_size = mul(weight_size.d2, weight_size.d3) + 1;
    unsigned out_fm_size = mul(conv_size.d2, conv_size.d3);
    #else
    // convert to pointer of array
    typedef short IN_TYPE[rd_size.d1][rd_size.d2][rd_size.d3];
    IN_TYPE *IN = (IN_TYPE *) (in + input_offset);

    typedef short WEIGHT_TYPE[weight_size.d0][weight_size.d1][mul(weight_size.d2, weight_size.d3) + 1]; // 3rdsize = height * weight + 1(bias)
    WEIGHT_TYPE *WEIGHT = (WEIGHT_TYPE *) weight;

    typedef short OUT_TYPE[conv_size.d1][conv_size.d2][conv_size.d3];
    OUT_TYPE *OUT = (OUT_TYPE *) (out + output_offset);
    #endif

    // convolution
    for (int no=0; no<wr_size.d1; no++) {
        // reset input pointer *ini for different outputs
        #ifndef USE_MUL
        short *ini = in;
        #endif

        for (int ni=0; ni<rd_size.d1; ni++) {
            // reset output pointer *outi for different inputs
            #ifndef USE_MUL
            short *outi = out;
            #endif

            for (int y=0; y<conv_out_h; y++) {
                // caculate ybase in advance to reduce duplicate calculations <- [1]
                int ybase = mul(y, stride) - pad;

                for (int x=0; x<conv_out_w; x++) {
                    // the same as [1]
                    int xbase = mul(x, stride) - pad;

                    // ni == 0 -> a new output -> set initial value = bias
                    if (ni == 0) {
                        #ifndef USE_MUL
                        *outi = *weight;
                        #else
                        (*OUT)[no][y][x] = (*WEIGHT)[no][0][0];
                        #endif
                    }

                    // temp result saved as int to reduce accuracy loss
                    int conv_res = 0;

                    // perform 1d conv
                    for (int ky=0; ky<weight_size.d2; ky++) {
                        // the same as [1]
                        int yoffset = mul(ky, weight_size.d3);
                        int ih = ky + ybase;

                        for (int kx=0; kx<weight_size.d3; kx++) {
                            // the same as [1]
                            int iw = kx + xbase;

                            // iw < 0 -> is padding -> +0, the same applies to others
                            if (iw >= 0 && iw < input_fm_w && ih >= 0 && ih < input_fm_h) {
                                #ifndef USE_MUL
                                conv_res += mul(
                                    *(ini + mul(ih, input_fm_w) + iw),
                                    *(weight + yoffset + kx + 1)
                                );
                                #else
                                conv_res += mul((*IN)[ni][ih][iw], (*WEIGHT)[no][ni][yoffset + kx + 1]);
                                #endif
                            }
                        }
                    }

                    // save result to mem & point to next pixel
                    #ifndef USE_MUL
                    *outi += conv_res >> FRAC_BIT;
                    outi ++;
                    #else
                    (*OUT)[no][y][x] += conv_res >> FRAC_BIT;
                    #endif
                }
            }
            // *outi has pointed to the next output naturally by ++
            // *ini point to next input
            #ifndef USE_MUL
            ini += in_fm_size;
            #endif
        }

        // all input has added, *out / *weight point to next output / weight
        #ifndef USE_MUL
        out += out_fm_size;
        weight += weight_fm_size;
        #endif
    }
}

short MAX(short a, short b) {
    return a > b ? a : b;
}

void pooling()
{
	short *out = (short *)addr.wr_addr;

	unsigned output_offset = 0;
	unsigned input_offset = 0;

	unsigned input_fm_w = conv_size.d3;
	unsigned input_fm_h = conv_size.d2;

	unsigned pad = KERN_ATTR_POOL_PAD;
	unsigned pad_len = pad << 1;

	unsigned pad_w_test = conv_size.d3 - KERN_ATTR_POOL_KERN_SIZE;
	unsigned pad_h_test = conv_size.d2 - KERN_ATTR_POOL_KERN_SIZE;

	unsigned pool_out_w = pad_w_test + pad_len;
	unsigned pool_out_h = pad_h_test + pad_len;

	unsigned stride = KERN_ATTR_POOL_STRIDE;

	unsigned pad_w_test_remain = pad_w_test - mul(div(pad_w_test, stride), stride);
	unsigned pad_h_test_remain = pad_h_test - mul(div(pad_h_test, stride), stride);

	pool_out_w = div(pool_out_w, stride);
	pool_out_h = div(pool_out_h, stride);
	pool_out_w++;
	pool_out_h++;

	if ((!pad) && (pad_w_test_remain || pad_h_test_remain))
	{
		pool_out_w++;
		pool_out_h++;
	}

	//TODO: Please add your implementation here
	short *in = (short *)addr.wr_addr;

    #ifndef USE_MUL
    in += input_offset;
    out += output_offset;
    unsigned in_fm_size = mul(conv_size.d2, conv_size.d3);
    #else
    // convert to pointer of array
    typedef short IN_TYPE[conv_size.d1][conv_size.d2][conv_size.d3];
    IN_TYPE *IN = (IN_TYPE *) (in + input_offset);

    typedef short OUT_TYPE[wr_size.d1][pool_out_h][pool_out_w];
    OUT_TYPE *OUT = (OUT_TYPE *) (out + output_offset);
    #endif

    // pooling
    for (int no=0; no<wr_size.d1; no++) {
        for (int y=0; y<pool_out_h; y++) {
            // the same as [1]
            int ybase = mul(y, stride) - pad;

            for (int x=0; x<pool_out_w; x++) {
                // the same as [1]
                int xbase = mul(x, stride) - pad;

                // max initialized as smallest of short
                short max = 0x8000;

                for (int ky=0; ky<KERN_ATTR_POOL_KERN_SIZE; ky++) {
                    // the same as [1]
                    int ih = ky + ybase;

                    for (int kx=0; kx<KERN_ATTR_POOL_KERN_SIZE; kx++) {
                        // the same as [1]
                        int iw = kx + xbase;

                        // iw < 0 => padding, others are the same
                        if (iw >= 0 && iw < input_fm_w && ih >= 0 && ih < input_fm_h) {
                            #ifndef USE_MUL
                            max = MAX(max, *(in + mul(ih, input_fm_w) + iw));
                            #else
                            max = MAX(max, (*IN)[no][ih][iw]);
                            #endif
                        }
                    }
                }

                // save result to mem & point to next pixel
                #ifndef USE_MUL
                *out = max;
                out ++;
                #else
                (*OUT)[no][y][x] = max;
                #endif
            }
        }

        // *out has pointed to the next output naturally by ++
        // *in point to next input
        #ifndef USE_MUL
        in += in_fm_size;
        #endif
    }
}

#ifdef USE_HW_ACCEL
void launch_hw_accel()
{
	volatile int* gpio_start = (void*)(GPIO_START_ADDR);
	volatile int* gpio_done = (void*)(GPIO_DONE_ADDR);

	//TODO: Please add your implementation here
    *gpio_start = 1;
    while (!(*gpio_done & 1)) ;
}
#endif

int comparing()
{
	char *out = (char *)addr.wr_addr;
	char *result = (char *)_binary_data_result_bin_start;

#ifdef USE_HW_ACCEL
	int count = (int)_binary_data_result_bin_size + 
		    (16 - WR_SIZE_D3) * 2 * WR_SIZE_D2 * WR_SIZE_D1;
#else
	int count = (int)_binary_data_result_bin_size;
#endif

	for (int i = 0, j = 0; i < count; i++)
	{
#ifdef USE_HW_ACCEL
		int alignment = i & 0x0000001f;
		if (alignment >= (WR_SIZE_D3 << 1))
			continue;
#endif
		if (*(out + i) != *(result + j))
		{
			printf("Failed! at address %x and %x with data %x and %x\n", out + i, result + j, *(out + i), *(result + j));
			return 1;
		}
		j++;
	}

	printf("Passed!\n");
	return 0;
}

int main()
{
    Result res;
    bench_prepare(&res);

#ifdef USE_HW_ACCEL
	printf("Launching task...\n");
	launch_hw_accel();
#else
	printf("starting convolution\n");
	convolution();
	printf("starting pooling\n");
	pooling();
#endif

    bench_done(&res);
    printf("Cycles: %u\n", res.msec);
    printf("Mem access cycles: %u\n", res.memtime);
    printf("Instruction count: %u\n", res.inst);

	int result = comparing();
	printf("benchmark finished\n");

	if (result == 0) {
		hit_good_trap();
	} else {
		nemu_assert(0);
	}

	return 0;
}
