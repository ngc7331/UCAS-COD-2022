# dma调试过程仿真加速波形图

1. 38370a59
  - commited: Jun 24, 2022 3:49pm GMT+0800
  - cycles: 40w ~ 60w
  - related fixes:
    + fix(dma): ptr

2. c3565088
  - commited: Jun 24, 2022 4:26pm GMT+0800
  - cycles: 60w ~ 80w

3. 4b6d89b1
  - commited: Jun 24, 2022 6:25pm GMT+0800
  - cycles: last 200w cycles until timeout
  - related fixes:
    + feat(data_mover): add performance counter
    + fix(dma): ptr

4. fa28c583
  - commited: Jun 25, 2022 2:47pm GMT+0800
  - cycles: 9600w ~ 9800w
  - related fixes:
    + feat(intr_handler): use new_tail - old_tail method

5. 160e6055
  - commited: Jun 26, 2022 4:02pm GMT+0800
  - cycles: 8350w ~ 8700w
  - related fixes:
    + fix(dma): condition of wr/rd complete
    + fix(dma): condition of burst_counter reset
