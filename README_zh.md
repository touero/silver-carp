<h1 align="center">silver-carp</h1>

<p align="center">
    <a href="https://github.com/touero/silver-carp/blob/master/README.md">English</a>
    <a href="https://github.com/touero/silver-carp/blob/master/README_zh.md">[中文]</a>
</p>

<p align="center">
<img src="https://img.shields.io/badge/matlab-green" alt=""> <img src="https://img.shields.io/badge/license_-GPL3.0-green" alt="">
</p>

<p align="center">
    <img src=.img/silver-carp.png height="200" width="200" alt="">
</p>


## 仓库介绍

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;了解公共产品的博弈模型、合作的演变和传播、随机网络下奖励惩罚对合作演化影响，并使用蒙特卡罗模拟分析来实现机制建模。  

## 背景介绍

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;城市里有很多大大小小的餐馆，每家餐馆每天都有可能接受相关部门的卫生检查。如果当天不做好卫生（即背叛），将处以罚款。利用这一机制在四个网络上展示合作和背叛。

## 模型思路

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当个体为合作者时，且无论是否接受检查，合作者则已经做好了卫生，不会受到处罚，此时个体合作者在全体中获得的收益：  

$$
D_{(i)} = \frac{NC \cdot r \cdot c}{NCD}
$$
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当个体为背叛者时，且接受检查的概率：

$$
inspectionP > 0.5
$$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;背叛者尚未做好卫生，此时背叛者的收益:

$$
D_{(i)} = D_{(i)} - penaltyAmount
$$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当群体合作率小于0.5时就获得奖励。最后计算个体的全部收益:

$$
E_{(i)} = totalpay - A_{(i)} \cdot NCD \cdot c + A_{(i)} \cdot individualRewards
$$

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加上其他群体获得的收益:

$$
individualRewards = individualRewards + reward(Node\\_neighbor(i,j))
$$

参数描述
```
c:                  合作者的合作成本
r:                  投入产出比
k:                  理性程度
penaltyAmount:      罚款
rewardAmount:       奖励
reward:             群体奖励
Cooperation_rate:   群组合作率
M1:                 行数
M2:                 列数
N:                  博弈轮数
A:                  表示合作或背叛者
D:                  每个个体在群组中的收益
E:                  每个个体的总收益
tongji:             存放着每个时刻的合作者比例
NC:                 表示群体i中合作者的个数
NCD:                群体i中的个体数
totalpay:           表示为个体i在多个群体中博弈的总收益
individualRewards:  个体所获得的全部奖励
```



<table>
    <tr>
        <th>网络类型</th>
        <th>默认参数<br>(penalty=1, reward=7)</th>
        <th>增大惩罚<br>(penalty=3, reward=7)</th>
        <th>增大奖励<br>(penalty=1, reward=12)</th>
    </tr>
    <tr>
        <td align="center">BA 无标度网络</td>
        <td><img src=.img/BAnetwork.png width="280" alt=""></td>
        <td><img src=.img/BAnetworkpenaltyAmount.png width="280" alt=""></td>
        <td><img src=.img/BAnetworkrewardAmount.png width="280" alt=""></td>
    </tr>
    <tr>
        <td align="center">随机网络</td>
        <td><img src=.img/randomnetwork.png width="280" alt=""></td>
        <td><img src=.img/randomnetworkpenaltyAmount.png width="280" alt=""></td>
        <td><img src=.img/randomnetworkrewardAmount.png width="280" alt=""></td>
    </tr>
    <tr>
        <td align="center">规则网格网络</td>
        <td><img src=.img/rulenetwork.png width="280" alt=""></td>
        <td><img src=.img/rulenetworkpenaltyAmount.png width="280" alt=""></td>
        <td><img src=.img/rulenetworkrewardAmount.png width="280" alt=""></td>
    </tr>
    <tr>
        <td align="center">小世界网络</td>
        <td><img src=.img/smallworldnetwork.png width="280" alt=""></td>
        <td><img src=.img/smallworldnetworkpenaltyAmount.png width="280" alt=""></td>
        <td><img src=.img/smallworldnetworkrewardAmount=7.png width="280" alt=""></td>
    </tr>
</table>

> 三列分别对比了不同参数下合作比例随时间的演化：**默认参数**作为基线，**增大惩罚**展示提高罚款对背叛行为的抑制效果，**增大奖励**展示提高奖励对合作行为的促进作用。四种网络结构（BA 无标度、随机、规则网格、小世界）从上到下排列，可横向对比网络拓扑对合作演化的影响。

## 生成结果图

项目中 `.img/` 目录下的 12 张演化曲线图，按以下步骤生成。**MATLAB 和 GNU Octave 均可执行**，以下分别说明。

> **Octave 用户注意**：Octave 需安装 `statistics` 包以支持 `randi` 函数。在 Octave 中执行：
> ```octave
> pkg load statistics
> ```

### 1. 生成网络拓扑

在工作区中创建 `Node_neighbor` 邻接矩阵。四种网络对应四个脚本，MATLAB 与 Octave 通用：

```matlab
% 选择一种网络运行（以 BA 无标度网络为例）：
run('scaleFreeNetwork.m')    % BA 无标度网络
% run('randomNetwork.m')     % 随机网络
% run('reluNetwork.m')       % 规则网格网络
% run('smallWorldNetwork.m') % 小世界网络
```

### 2. 运行博弈模拟

`goodGame.m` 使用工作区中的 `Node_neighbor` 进行蒙特卡洛模拟（默认 3500 轮），绘制合作比例随时间演化曲线。

**MATLAB 用户**：直接 `run` 即可。

**Octave 用户**：`goodGame.m` 兼容 Octave，同样用 `run` 执行。若图形窗口未弹出，在脚本开头加上 `figure;`，或在 Octave 中先执行 `graphics_toolkit('qt')` 切换渲染后端。

### 3. 三组参数对比

修改 `goodGame.m` 顶部的参数，逐次运行并保存图片。以 BA 无标度网络为例：

| 图 | 参数修改 | 保存文件名 |
|----|----------|------------|
| 默认基线 | 不改（`penaltyAmount=1, rewardAmount=7`） | `.img/BAnetwork.png` |
| 增大惩罚 | 第 4 行改为 `penaltyAmount=3` | `.img/BAnetworkpenaltyAmount.png` |
| 增大奖励 | 第 5 行改为 `rewardAmount=12`（第 4 行恢复为 1） | `.img/BAnetworkrewardAmount.png` |

```matlab
% ---- 第一张：默认参数 ----
run('scaleFreeNetwork.m')     % 生成网络
% goodGame.m 参数保持默认: penaltyAmount=1, rewardAmount=7
run('goodGame.m')

% 在图形窗口中手动 File → Save As → .img/BAnetwork.png
% 或用命令：
% MATLAB:   saveas(gcf, '.img/BAnetwork.png')
% Octave:   print('-dpng', '.img/BAnetwork.png')

% ---- 第二张：增大惩罚 ----
% 将 goodGame.m 第 4 行改为 penaltyAmount=3
run('goodGame.m')
saveas(gcf, '.img/BAnetworkpenaltyAmount.png')

% ---- 第三张：增大奖励 ----
% 将 goodGame.m 第 4 行恢复为 1，第 5 行改为 rewardAmount=12
run('goodGame.m')
saveas(gcf, '.img/BAnetworkrewardAmount.png')
```

**Octave 保存图片命令**（与 MATLAB 略有不同）：
```octave
print('-dpng', '-r120', '.img/BAnetwork.png')   % -r120 设置输出分辨率
```

### 4. 重复四种网络

对每种网络重复步骤 1-3，即可生成全部 12 张图：

```
.img/BAnetwork.png                .img/BAnetworkpenaltyAmount.png                .img/BAnetworkrewardAmount.png
.img/randomnetwork.png            .img/randomnetworkpenaltyAmount.png            .img/randomnetworkrewardAmount.png
.img/rulenetwork.png              .img/rulenetworkpenaltyAmount.png              .img/rulenetworkrewardAmount.png
.img/smallworldnetwork.png        .img/smallworldnetworkpenaltyAmount.png        .img/smallworldnetworkrewardAmount=7.png
```

### 线条颜色与样式

`goodGame.m` 第 85 行控制绘图的颜色和线型：

```matlab
plot(1:length(tongji), tongji, '-r', 'LineWidth', 0.5)
%                                ^^^
%   '-r' = 红色实线    '-b' = 蓝色实线    '-g' = 绿色实线
%   '--r' = 红色虚线   '-.b' = 蓝点划线   ':k' = 黑色点线
```

配合第 89 行的 `hold on`，可在同一图上叠加多条不同颜色的曲线以对比效果。

## 安装

需要使用 [Matlab](https://www.mathworks.com/products/matlab.html) [Git](https://git-scm.com/). 请检查它们是否被正确安装.

```shell
$ git clone https://github.com/touero/silver-carp.git
```



## 相关链接

- [MATLAB](https://www.mathworks.com/products/matlab.html)
- [Monte Carlo Analysis](https://www.investopedia.com/terms/m/montecarlosimulation.asp)



## 维护者

[@touero](https://github.com/touero)



## 贡献

尝试提交 [Open an issue](https://github.com/touero/silver-carp/issues) or submit PRs.



### 贡献者

这个项目的存在要感谢所有的贡献者。



## 许可
[GNU General Public License v3.0](https://github.com/touero/silver-carp/blob/master/LICENSE.txt)

