<h1 align="center">opsariichthys-bidens</h1>

<p align="center">
<img src="https://img.shields.io/badge/matlab-green" alt=""> <img src="https://img.shields.io/badge/license_-GPL3.0-green" alt="">
</p>

## Repository Introduction 仓库介绍

Understand the game model of public goods, the evolution and dissemination of cooperation, and the impact of rewards and punishments on cooperation evolution under random networks, and use Monte Carlo simulation analysis to achieve mechanism modeling.  
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;了解公共产品的博弈模型、合作的演变和传播、随机网络下奖励惩罚对合作演化影响,并使用蒙特卡罗模拟分析来实现机制建模。  

💕 If it's helpful to you or you clone it, please star it. This is maximum encouragement for open-source contributors。 💕  
  
💕 如果它对你有帮助或克隆了它，请将其列为星号。这是对开源贡献者的最大鼓励。 💕  

## Background Introduction 背景介绍

There are many restaurants of all sizes in the city, and each restaurant has a probability of being subjected to hygiene checks by relevant departments every day. If hygiene is not done on that day (i.e. betrayal), fines will be imposed. Use this mechanism to demonstrate cooperation and betrayal on four networks.  
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;城市里有很多大大小小的餐馆，每家餐馆每天都有可能接受相关部门的卫生检查。如果当天不做好卫生（即背叛），将处以罚款。利用这一机制在四个网络上展示合作和背叛。

## Model Ideas 模型思路

When an individual is a collaborator and regardless of whether they undergo inspection or not, the collaborator has already done a good job of hygiene and will not be punished. At this point, the profit that the individual collaborator obtains from the whole is as follows:  
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当个体为合作者时，且无论是否接受检查，合作者则已经做好了卫生，不会受到处罚，此时个体合作者在全体中获得的收益：  
<p align="center">
    <img src=.img/img1_.png alt="">
</p>

When an individual is a betrayer and the probability of being tested meets the following criteria.  
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当个体为背叛者时，且接受检查的概率：
<p align="center">
    <img src=.img/img2_.png alt="">
</p>

The betrayer has not yet done a good job in hygiene, and at this point, the benefits of the betrayer are:  
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;背叛者尚未做好卫生，此时背叛者的收益为
<p align="center">
    <img src=.img/img3_.png alt="">
</p>

Rewards are awarded when the group cooperation rate is less than 0.5. Finally, calculate the total income of the individual:  
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当群体合作率小于0.5时就获得奖励。最后计算个体的全部收益:
<p align="center">
    <img src=.img/img4_.png alt="">
</p>

Plus benefits from other groups  
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加上其他群体获得的收益:
<p align="center">
    <img src=.img/img5_.png alt="">
</p>

> Parameter Description  参数描述
>> c: Cooperation costs for collaborators 合作者的合作成本  
>> r: Input-output ratio 投入产出比  
>> k: Rationality level 理性程度  
>> penaltyAmount:Fine 罚款  
>> rewardAmount: Reward 奖励  
>> reward: group reward 群体奖励  
>> Cooperation_rate: Group combination work rate 群组合作率  
>> M1: Number of rows 行数  
>> M2: Number of columns 列数  
>> N: Number of game rounds 博弈轮数  
>> A: Denotes a collaborator or betrayer 表示合作或背叛者  
>> D: Benefits of each individual in the group 每个个体在群组中的收益  
>> E: Total income per individual 每个个体的总收益  
>> tongji: stores the proportion of collaborators at each moment 存放着每个时刻的合作者比例  
>> NC: represents the number of co authors in group i 表示群体i中合作者的个数  
>> NCD：Number of individuals in group i 群体i中的个体数  
>> totalpay：Represented as the total return of individual i playing games in multiple groups 表示为个体i在多个群体中博弈的总收益  
>> individualRewards：All rewards received by individuals 个体所获得的全部奖励  


<table>
    <tr>
        <td>diffNetwork</td>
        <td>penaltyAmount</td>
        <td>rewardAmount</td>
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

## Install

This project uses [Matlab](https://www.mathworks.com/products/matlab.html) [Git](https://git-scm.com/). Go check them out if you don't have them locally installed.

```shell
$ git clone https://github.com/weiensong/opsariichthys-bidens.git
```



## Related Efforts

- [MATLAB](https://www.mathworks.com/products/matlab.html)
- [Monte Carlo Analysis](https://www.investopedia.com/terms/m/montecarlosimulation.asp)



## Maintainers

[@weiensong](https://github.com/weiensong)



## Contributing


Feel free to dive in! [Open an issue](https://github.com/weiensong/opsariichthys-bidens/issues) or submit PRs.



### Contributors

This project exists thanks to all the people who contribute.



## License

[MIT](https://github.com/weiensong/opsariichthys-bidens/blob/master/LICENSE) © weiensong

