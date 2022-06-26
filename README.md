# UCAS-COD-2022
## 目录/文件说明
- COD-Lab: 完整的 COD-Lab 仓库，作为 git submodule 存在于本仓库，由于含有大量老师写的代码和含隐私信息的实验报告，不开源
- hardware: 硬件部分，对应 COD-Lab 的`COD-Lab/fpga/design/ucas-cod/hardware/sources`目录
- software: 软件部分，对应 COD-Lab 的`COD-Lab/software/workload/ucas-cod/benchmark/simple_test`目录下部分文件
- prj*: 实验相关文件，包含方便实验的一些脚本，写实验报告时用到的反汇编代码、日志文件和波形图等
- `pre-commit`及`install-pre-commit.sh`: 为了便于把 COD-Lab 的内容同步到本仓库，我使用了 git hook 脚本，即前者，后者是把前者安装到`.git/hook`目录下的脚本。

## 一点遗憾 & 希望
在我完成 prj5 实验前后，学校的 fpga 板卡出现了严重的不稳定的问题，同样的代码往往要运行数次甚至数十次，哪怕是一两行的代码修改都要等待1个小时甚至更多。在这种条件下，我做完了 cache 和 dnn 实验，又艰难地写出了不能算完全成功的 dma。期末临近，实在是没有精力继续流水线和性能优化的部分。

之所以说 dma 不能算完全成功，是因为尽管这版代码在 emu 仿真加速流程中正确的打印了性能计数器结果，[波形](prj5-dma/sim_out/160e6055/dump.fst)也显示 cpu 运行到了`hit_good_trap`函数并向`0xc`地址写入了0，在正常评测流程中却报出了 `custom cpu running time out` 错误。

询问老师后得到了“感觉可能还是dma有访存请求没有回来，但是emu调不出来了，emu的访存模型和真实的ddr还是有差距的，所以就调到这里就可以了”的回复。尽管我的强迫症使我还想继续完善，调试工具的缺失、板卡的不稳定、期末周的压力和知识的不足还是迫使我放弃了这个想法。

也许未来某天心血来潮会继续完善吧（可能性无限接近于0）

希望老师们可以尽快调好云平台和 fpga 板卡，给未来的同学们更好的实验基础设施🙏

以及下学期的体系结构课疑似还要写 verilog，希望人没事🙏

## **请 勿 抄 袭**
