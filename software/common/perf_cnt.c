#include "perf_cnt.h"

volatile unsigned long *perf_cnt[] = {
  (void *)0x60010000, (void *)0x60010008,
  (void *)0x60011000, (void *)0x60011008,
  (void *)0x60012000, (void *)0x60012008,
  (void *)0x60013000, (void *)0x60013008,
  (void *)0x60014000, (void *)0x60014008,
  (void *)0x60015000, (void *)0x60015008,
  (void *)0x60016000, (void *)0x60016008,
  (void *)0x60017000, (void *)0x60017008
};

#define cycle_cnt (perf_cnt[0])
#define mem_cycle_cnt (perf_cnt[1])
#define if_cycle_cnt (perf_cnt[4])
#define wt_cycle_cnt (perf_cnt[5])
#define rd_cycle_cnt (perf_cnt[6])
#define inst_cnt (perf_cnt[2])
#define nop_cnt (perf_cnt[3])
#define jump_cnt (perf_cnt[7])

unsigned long _uptime() {
  // TODO [COD]
  //   You can use this function to access performance counter related with time or cycle.
  return *cycle_cnt;
}

// memory access
unsigned long _memtime() {
  return *mem_cycle_cnt;
}
unsigned long _iftime() {
  return *if_cycle_cnt;
}
unsigned long _wttime() {
  return *wt_cycle_cnt;
}
unsigned long _rdtime() {
  return *rd_cycle_cnt;
}

// instruction
unsigned long _inst() {
    return *inst_cnt;
}
unsigned long _nop() {
  return *nop_cnt;
}
unsigned long _jump() {
  return *jump_cnt;
}

void bench_prepare(Result *res) {
  // TODO [COD]
  //   Add preprocess code, record performance counters' initial states.
  //   You can communicate between bench_prepare() and bench_done() through
  //   static variables or add additional fields in `struct Result`
  res->msec = _uptime();
  res->memtime = _memtime();
  res->iftime = _iftime();
  res->wttime = _wttime();
  res->rdtime = _rdtime();
  res->inst = _inst();
  res->nop = _nop();
  res->jump = _jump();
}

void bench_done(Result *res) {
  // TODO [COD]
  //  Add postprocess code, record performance counters' current states.
  res->msec = _uptime() - res->msec;
  res->memtime = _memtime() - res->memtime;
  res->iftime = _iftime() - res->iftime;
  res->wttime = _wttime() - res->wttime;
  res->rdtime = _rdtime() - res->rdtime;
  res->inst = _inst() - res->inst;
  res->nop = _nop() - res->nop;
  res->jump = _jump() - res->jump;
}

