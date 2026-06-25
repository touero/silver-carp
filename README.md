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
        <th>Network Type</th>
        <th>Default<br>(penalty=1, reward=7)</th>
        <th>Higher Penalty<br>(penalty=3, reward=7)</th>
        <th>Higher Reward<br>(penalty=1, reward=12)</th>
    </tr>
    <tr>
        <td align="center">BA scale-free</td>
        <td><img src=.img/BAnetwork.png width="280" alt=""></td>
        <td><img src=.img/BAnetworkpenaltyAmount.png width="280" alt=""></td>
        <td><img src=.img/BAnetworkrewardAmount.png width="280" alt=""></td>
    </tr>
    <tr>
        <td align="center">Random</td>
        <td><img src=.img/randomnetwork.png width="280" alt=""></td>
        <td><img src=.img/randomnetworkpenaltyAmount.png width="280" alt=""></td>
        <td><img src=.img/randomnetworkrewardAmount.png width="280" alt=""></td>
    </tr>
    <tr>
        <td align="center">Regular lattice</td>
        <td><img src=.img/rulenetwork.png width="280" alt=""></td>
        <td><img src=.img/rulenetworkpenaltyAmount.png width="280" alt=""></td>
        <td><img src=.img/rulenetworkrewardAmount.png width="280" alt=""></td>
    </tr>
    <tr>
        <td align="center">Small-world</td>
        <td><img src=.img/smallworldnetwork.png width="280" alt=""></td>
        <td><img src=.img/smallworldnetworkpenaltyAmount.png width="280" alt=""></td>
        <td><img src=.img/smallworldnetworkrewardAmount=7.png width="280" alt=""></td>
    </tr>
</table>

> The three columns compare the evolution of the cooperation ratio under different parameters: **default** as baseline, **higher penalty** shows the suppression effect of increased fines on betrayal, and **higher reward** shows the promotion effect of increased rewards on cooperation. The four network structures (BA scale-free, random, regular lattice, small-world) are arranged top to bottom for cross-comparison of how network topology affects cooperation evolution.

## Generate Result Figures

The 12 evolution curves under `.img/` are generated following the steps below. **Both MATLAB and GNU Octave are supported** — see platform-specific notes below.

> **Octave users**: Octave requires the `statistics` package for the `randi` function. Load it first:
> ```octave
> pkg load statistics
> ```

### 1. Generate Network Topology

Run one of the four network scripts to create the `Node_neighbor` adjacency matrix in the workspace. These scripts work identically in MATLAB and Octave:

```matlab
% Pick one network (example: BA scale-free):
run('scaleFreeNetwork.m')    % BA scale-free network
% run('randomNetwork.m')     % Random network
% run('reluNetwork.m')       % Regular lattice network
% run('smallWorldNetwork.m') % Small-world network
```

### 2. Run the Game Simulation

`goodGame.m` uses the `Node_neighbor` matrix to run a Monte Carlo simulation (3500 rounds by default) and plots the cooperation ratio over time.

**MATLAB users**: Simply use `run` as shown below.

**Octave users**: `goodGame.m` is compatible with Octave. If the figure window does not appear, add `figure;` at the top of the script, or run `graphics_toolkit('qt')` in Octave first to switch the rendering backend.

### 3. Three Parameter Sets for Comparison

Modify the parameters at the top of `goodGame.m`, then run and save the figure. Example for the BA scale-free network:

| Figure | Parameter Change | Output File |
|--------|-----------------|-------------|
| Default baseline | No change (`penaltyAmount=1, rewardAmount=7`) | `.img/BAnetwork.png` |
| Higher penalty | Change line 4 to `penaltyAmount=3` | `.img/BAnetworkpenaltyAmount.png` |
| Higher reward | Restore line 4 to 1, change line 5 to `rewardAmount=12` | `.img/BAnetworkrewardAmount.png` |

```matlab
% ---- 1st figure: default parameters ----
run('scaleFreeNetwork.m')     % generate network
% goodGame.m params at default: penaltyAmount=1, rewardAmount=7
run('goodGame.m')

% In the figure window: File → Save As → .img/BAnetwork.png
% Or via command:
% MATLAB:   saveas(gcf, '.img/BAnetwork.png')
% Octave:   print('-dpng', '.img/BAnetwork.png')

% ---- 2nd figure: higher penalty ----
% Change goodGame.m line 4 to: penaltyAmount=3
run('goodGame.m')
saveas(gcf, '.img/BAnetworkpenaltyAmount.png')

% ---- 3rd figure: higher reward ----
% Restore goodGame.m line 4 to 1, change line 5 to: rewardAmount=12
run('goodGame.m')
saveas(gcf, '.img/BAnetworkrewardAmount.png')
```

**Octave save command** (slightly different from MATLAB):
```octave
print('-dpng', '-r120', '.img/BAnetwork.png')   % -r120 sets output resolution
```

### 4. Repeat for All Four Networks

Repeat steps 1-3 for each network type to produce all 12 figures:

```
.img/BAnetwork.png                .img/BAnetworkpenaltyAmount.png                .img/BAnetworkrewardAmount.png
.img/randomnetwork.png            .img/randomnetworkpenaltyAmount.png            .img/randomnetworkrewardAmount.png
.img/rulenetwork.png              .img/rulenetworkpenaltyAmount.png              .img/rulenetworkrewardAmount.png
.img/smallworldnetwork.png        .img/smallworldnetworkpenaltyAmount.png        .img/smallworldnetworkrewardAmount=7.png
```

### Line Color and Style

Line 85 of `goodGame.m` controls the plot color and line style:

```matlab
plot(1:length(tongji), tongji, '-r', 'LineWidth', 0.5)
%                                ^^^
%   '-r' = red solid     '-b' = blue solid    '-g' = green solid
%   '--r' = red dashed   '-.b' = blue dash-dot   ':k' = black dotted
```

Combined with `hold on` on line 89, you can overlay multiple curves with different colors on the same figure for comparison.

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

