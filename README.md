# Solution to MATLAB and Simulink Challenge project 225 -Satellite Collision Avoidance

## Problem Statement

The satellite industry is experiencing unprecedented growth, with new companies launching record numbers of satellites transforming global communication, providing near real-time images of our planet, and even enabling commercial space tourism.

As more and more satellites are added to low Earth orbit, the probability of collisions between satellites and orbital debris continues to rise. This is compounded by the fact that any collisions that do occur (either between operational satellites and debris or two pieces of debris) create more space debris on impact. Satellites and orbital debris travel at orbital speeds greater than 17,500 mph (7825 m/s) in low earth orbit. At these speeds, even relatively small orbital debris can cause substantial to catastrophic damage to a satellite or a spacecraft if a collision occurs.

[Matlab-Simulink-Challenge-Project-Hub](https://github.com/mathworks/MATLAB-Simulink-Challenge-Project-Hub)

[Project description link](https://github.com/mathworks/MATLAB-Simulink-Challenge-Project-Hub/wiki#instructions-for-project-solution-submission)


## Project details

### Collision Avoidance Strategy

A track-along (in-track) $\Delta V$ maneuver is employed in this project.

- The maneuver is applied along the instantaneous velocity direction
- Executed hours before the predicted Time of Closest Aproach (TCA)
- Causes a phase shift in the satellite's orbit
- Results in an increased searation distance at TCA

The avoidance logic is purely distance-based,
- No probability-of-collision model is used
- The maneuver objective is to increase miss distance.

### Software Requirements

To run this project, the following MATLAB roducts are required:

#### Required Toolbox

- MATLAB (R2022b or later recommended)
- Aerospace Toolbox
- Financial Toolbox

## Repositary Structure

```text
Satellite-Collision-Avoidance-225/
├── LICENSE
├── README.md
├── project_plan.md
├── run.m
│
├── data/
│   └── debris/
│       ├── debris_data.md
│       └── iridium33_deb.tle
│
├── docs/
│   ├── Avoidance Maneuver/
│   │   └── avoidanceManeuver.md
│   │
│   ├── Mission Definition/
│   │   ├── analysis_background.md
│   │   ├── mission_definition.md
│   │   └── problem_statement.md
│   │
│   └── Books/
│       ├── CA_Handbook_CM.pdf
│       ├── Fundamentals of AstroDynamics_Bate,Muller and White.pdf
│       └── Orbital Mechanics for Engineering Students.pdf
│
├── results/
│   ├── Compare_Maneuvers.png
│   └── Compare_before_and_after_maneuver.mp4
│
└── src/
    ├── avoidance/
    │   ├── maneuver.m
    │   ├── plan_avoidance_maneuver.m
    |   ├── postManeuver.m
    │   └── preManeuver.m
    │
    ├── conjunction/
    │   ├── conjunction_assessment.m
    │   └── detect_conjunctions.m
    │
    ├── propagation/
    │   ├── debris_propagation_sgp4.m
    │   └── satellite_propagation.m
    │
    └── utils/
        ├── createDebris.m
        ├── createSat.m
        ├── createScenario.m
        └── mission_definition.m
```


# How to run the project

To run the whole project, a main file has been created named **run.m** which is in the top level of the repositary

# Demo/Results
Add a video or animated gif/picture to showcase the code in operation and/or the expected results.
  
# Reference
Add reference papers, data, or supporting material that has been used, if any.
