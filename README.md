
# 飞行品质部分-建模、配平、线性化、模态分析

## 运行环境

* Matlab R2022b

## 主文件

* 打开live脚本```test_trim_lon_HV.mlx```按飞行包线进行批量配平线化
* 打开```mdl.slx```模型文件进行模型查看与修改
* rs开头文件是使用符号工具箱进行公式与模型的推导

## 模型文件要求

为配平与线性化程序可以正常工作，所建立的操稳模型必须按以下顺序实现输入、状态与输出变量。

### 输入顺序

1. da
2. de
3. dr
4. thr

### 状态变量顺序

1. V
2. alpha
3. beta
4. p
5. q
6. r
7. phi
8. theta

### 输出变量顺序

1. V (TAS)
2. alpha
3. beta
4. p
5. q
6. r
7. phi
8. theta
9. GS (Ground Speed)
10. hdot (Climb rate)
11. Nz
12. gamma (flight path angle)
13. EAS (CAS)
14. Ny
15. Mach

## 工具箱潜在功能

包括：
* 动力学建模
* 气动建模
* 配平
* 静操纵性
* 线性化
* 模态分析
* 飞行仿真
