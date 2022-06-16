
#ifndef __PERF_CNT__
#define __PERF_CNT__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct Result {
	int pass;
	unsigned long msec;
	unsigned long memtime;
	unsigned long iftime;
	unsigned long wttime;
	unsigned long rdtime;
	unsigned long inst;
	unsigned long nop;
	unsigned long jump;
} Result;

void bench_prepare(Result *res);
void bench_done(Result *res);

#endif
