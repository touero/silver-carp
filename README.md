<h1 align="center">silver-carp</h1>

<p align="center">
    <a href="https://github.com/touero/silver-carp/blob/master/README.md">[English]</a>
    <a href="https://github.com/touero/silver-carp/blob/master/README_zh.md">中文</a>
</p>

<p align="center">
<img src="https://img.shields.io/badge/matlab-green" alt=""> <img src="https://img.shields.io/badge/license_-GPL3.0-green" alt="">
</p>

<p align="center">
    <img src=.img/silver-carp.png height="200" width="200" alt="">
</p>

## Repository Introduction

Understand the game model of public goods, the evolution and dissemination of cooperation, and the impact of rewards and punishments on cooperation evolution under random networks, and use Monte Carlo simulation analysis to achieve mechanism modeling.  

## Background Introduction 

There are many restaurants of all sizes in the city, and each restaurant has a probability of being subjected to hygiene checks by relevant departments every day. If hygiene is not done on that day (i.e. betrayal), fines will be imposed. Use this mechanism to demonstrate cooperation and betrayal on four networks.  

## Model Ideas
When an individual is a collaborator and regardless of whether they undergo inspection or not, the collaborator has already done a good job of hygiene and will not be punished. At this point, the profit that the individual collaborator obtains from the whole is as follows:  

$$
D_{(i)} = \frac{NC \cdot r \cdot c}{NCD}
$$

When an individual is a betrayer and the probability of being tested meets the following criteria. 

$$
inspectionP > 0.5
$$


The betrayer has not yet done a good job in hygiene, and at this point, the benefits of the betrayer are:  

$$
D_{(i)} = D_{(i)} - penaltyAmount
$$

Rewards are awarded when the group cooperation rate is less than 0.5. Finally, calculate the total income of the individual:  

$$
E_{(i)} = totalpay - A_{(i)} \cdot NCD \cdot c + A_{(i)} \cdot individualRewards
$$

Plus benefits from other groups  

$$
individualRewards = individualRewards + reward(Node\\_neighbor(i,j))
$$


Parameter Description:  
```
c:                  Cooperation costs for collaborators
r:                  Input-output ratio
k:                  Rationality level
penaltyAmount:      Fine
rewardAmount:       Reward
reward:             group reward
Cooperation_rate:   Group combination work rate
M1:                 Number of rows
M2:                 Number of columns
N:                  Number of game rounds
A:                  Denotes a collaborator or betrayer
D:                  Benefits of each individual in the group
E:                  Total income per individual
tongji:             stores the proportion of collaborators at each moment
NC:                 represents the number of co authors in group i
NCD:                Number of individuals in group i
totalpay:           Represented as the total return of individual i playing games in multiple groups
individualRewards:  All rewards received by individuals
```

<table>
    <tr>
        <td>diffNetwork default</td>
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

## Generate Result Figures

The 12 evolution curves under `.img/` are generated one by one through the following steps:

### 1. Generate Network Topology

Run the corresponding network script in MATLAB to create the `Node_neighbor` adjacency matrix in the workspace:

| Script | Network Type |
|--------|-------------|
| `scaleFreeNetwork.m` | BA scale-free network |
| `randomNetwork.m` | Random network |
| `reluNetwork.m` | Regular lattice network |
| `smallWorldNetwork.m` | Small-world network |

### 2. Run Simulation and Save Figures

`goodGame.m` uses the `Node_neighbor` matrix in the workspace to run a Monte Carlo simulation and plot the cooperation ratio over time.

**Default parameters** (first column of the table):

```matlab
% Example with BA scale-free network
run('scaleFreeNetwork.m')
% Keep default params in goodGame.m: penaltyAmount=1, rewardAmount=7
run('goodGame.m')
saveas(gcf, '.img/BAnetwork.png')
```

**Penalty effect** (second column) — modify the `penaltyAmount` value on line 4 of `goodGame.m`:

```matlab
% penaltyAmount = 3  (change line 4 of goodGame.m to penaltyAmount=3)
run('goodGame.m')
saveas(gcf, '.img/BAnetworkpenaltyAmount.png')
```

**Reward effect** (third column) — modify the `rewardAmount` value on line 5 of `goodGame.m`:

```matlab
% rewardAmount = 12  (change line 5 of goodGame.m to rewardAmount=12)
run('goodGame.m')
saveas(gcf, '.img/BAnetworkrewardAmount.png')
```

### 3. Repeat for All Four Networks

Repeat steps 1-2 for each network type, producing 12 figures in total:

```
.img/BAnetwork.png                    .img/BAnetworkpenaltyAmount.png                    .img/BAnetworkrewardAmount.png
.img/randomnetwork.png                .img/randomnetworkpenaltyAmount.png                .img/randomnetworkrewardAmount.png
.img/rulenetwork.png                  .img/rulenetworkpenaltyAmount.png                  .img/rulenetworkrewardAmount.png
.img/smallworldnetwork.png            .img/smallworldnetworkpenaltyAmount.png            .img/smallworldnetworkrewardAmount=7.png
```

> **Note**: The `'-r'` on line 85 of `goodGame.m` controls line color and style. To produce curves with different colors for comparison, manually change this string (e.g., `'-b'` for blue, `'-g'` for green, `'--r'` for red dashed), combined with `hold on` (line 89) to overlay multiple curves on the same figure.

## Install

This project uses [Matlab](https://www.mathworks.com/products/matlab.html) [Git](https://git-scm.com/). Go check them out if you don't have them locally installed.

```shell
$ git clone https://github.com/touero/silver-carp.git
```



## Related Efforts

- [MATLAB](https://www.mathworks.com/products/matlab.html)
- [Monte Carlo Analysis](https://www.investopedia.com/terms/m/montecarlosimulation.asp)



## Maintainers

[@touero](https://github.com/touero)



## Contributing


Feel free to dive in! [Open an issue](https://github.com/touero/silver-carp/issues) or submit PRs.



### Contributors

This project exists thanks to all the people who contribute.



## License
[GNU General Public License v3.0](https://github.com/touero/silver-carp/blob/master/LICENSE.txt)

