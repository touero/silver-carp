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
        <td>默认</td>
        <td>惩罚</td>
        <td>奖励</td>
    </tr>
    <tr>
        <td><img src=.img/BAnetwork.png alt=""></td>
        <td><img src=.img/BAnetworkpenaltyAmount.png alt=""></td>
        <td><img src=.img/BAnetworkrewardAmount.png alt=""></td>
    </tr>
    <tr>
        <td><img src=.img/randomnetwork.png alt=""></td>
        <td><img src=.img/randomnetworkpenaltyAmount.png alt=""></td>
        <td><img src=.img/randomnetworkrewardAmount.png alt=""></td>
    </tr>
    <tr>
        <td><img src=.img/rulenetwork.png alt=""></td>
        <td><img src=.img/rulenetworkpenaltyAmount.png alt=""></td>
        <td><img src=.img/rulenetworkrewardAmount.png alt=""></td>
    </tr>
    <tr>
        <td><img src=.img/smallworldnetwork.png alt=""></td>
        <td><img src=.img/smallworldnetworkpenaltyAmount.png alt=""></td>
        <td><img src=.img/smallworldnetworkrewardAmount=7.png alt=""></td>
    </tr>
    
</table>

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

