# MSMS project 2022: DRS simulation

Study project for the course Modeling and Simulation of Mechatronic Systems, held by professor Francesco Biral, University of Trento.

Link to project final presentation: [link](https://1drv.ms/p/s!Aj8QjUFmeyl8gcMmEu5Ztam8ViHDSw?e=iIYkVp).

## Introduciton

The project consists in the kinematic and dynamic analysis of three dirrent designs for a formula 1 Drag Reduction System (DRS). 
The three designs are called:
- DRS1 or Pod-pull, figure (c), studied by Mattia Pettene.
- DRS2 or Push-up, figure (a), studied by Natale Consalvi.
- DRS3 or Pod-rocker, figure (b), studied by Matteo Albi.

![DRS schemes](/pictures/cad_quotes_schemes/DRSdesigns.png)
Further explanations can be found in the [project description](/papers/MSMS-Course%20Project-2022.pdf) file.

## Data

For the design of the rear wing profile, this [cad](/cad/F1_Rear_wing_2019.step) has been used as reference.
For the dynamic specifications, drag coefficients and forces magnitude, [this paper](/papers/2019-dimastrogiovanni-An%20improved%20active%20drag%20reduction%20system%20for%20formula%20race%20cars.pdf) has been used as reference, projecting the values on the chosed design of the wing.

## Project steps

### QFD analysis

The first step was the definition of the QFD of the system, here the detailed [report](/assignments/1/DRS_first_assignment_group17.pdf).

### Design analysis and optimization

#### DRS1 

- [Kinematic and Dynamic analysis](/maple/DRS1/drs_pod_pull_new.mw).
- [Synthesis](/maple/DRS1/drs_pod_pull_synthesis.mw).

#### DRS2

- [Kinematic and Dynamic analysis](/maple/DRS2/Final/A-Kin-Dyn-Hydraulic.mw).
- [Optimization](/maple/DRS2/Final/A-Kin-Dyn-Optimization.mw).

#### DRS3

- [Kinematic analysis](/maple/DRS3/DRS3_rec_kinematic_final.mw).
- [Dynamic analysis](/maple/DRS3/DRS3_rec_kinematic_final.mw).
- [Optimization and synthesis](/maple/DRS3/DRS3_rec_synthesis_final.mw). 

#### MapleSim

All designs were also studied using maplesim:
- [Hydraulic actuation](/maplesim/actuator2.msim): block used to simulate the actuation system.
- [Spolier](/maplesim/spoiler.msim): block representing the spoiler body.
- [DRS1](/maplesim/DRS1.msim), [DRS2](/maplesim/DRS2.msim), [DRS3](/maplesim/DRS3.msim): designs implementation.

## Other files

- In the [matlab](/matlab/) folder, there are attempts of solving the DAE equations of the dynamic using matlab (without success).
- In [pictures](/pictures/) and [papers](/papers/) can be fund all examples and references used during the project.  
- In [assignments](/assignments/) folder, draft of reports can be found.
