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


## How to run the project

To run the whole project, a main file has been created named **run.m** which is in the top level of the repositary


## Workflow of `run.m`

The `run.m` script serves as the **main execution entry point** for the *Satellite Collision Avoidance* project.  
It coordinates **data loading, orbit propagation, conjunction analysis, avoidance maneuver planning, and post-maneuver evaluation**.

---

### Environment Setup (Path Configuration)

```matlab
addpath('src\avoidance\');
addpath('src\conjunction\');
addpath('src\propagation\');
addpath('src\utils\');
addpath('data\debris\');
```
Purpose

- Adds all functional modules to the MATLAB path
- Enables modular execution of the project components

Related Directories
- `src/avoidance/`
- `src/conjunction/`
- `src/propagation/`
- `src/utils/`
- `data/debris/`

### Debris Data Input (TLE File)
```matlab
debrisFile = 'data/debris/iridium33_deb.tle';
```
Purpose
- Specifies the Two-Line Element (TLE) file of orbital debris
- Used for SGP4-based debris orbit propagation

### Core Function Execution

```matlab
[missDistanceAfterManeuver, pos, velocity, maneuverStartTime, ...
 missDistanceBeforeManeuver, TCA] = postManeuver(debrisFile);
```

This function integrates the entire collision avoidance pipeline, from scenario creation to post-maneuver assessment.

### Internal Workflow of postManeuver.m
#### a) Scenario Creation

Initializes satellite, debris, and mission parameters.

Functions Used

- `createSat.m`
- `createDebris.m`
- `createScenario.m`

📂 `src/utils/`

#### b) Orbit Propagation

Propagates satellite and debris orbits prior to maneuver execution.

Functions Used

- `satellite_propagation.m`
- `debris_propagation_sgp4.m`

📂 `src/propagation/`

#### c) Conjunction Detection

Computes relative motion and determines the Time of Closest Approach (TCA) and miss distance.

Functions Used

- `detect_conjunctions.m`
- `conjunction_assessment.m`

📂 `src/conjunction/`


#### d) Avoidance Maneuver 

- `plan_avoidance_maneuver.m`

    The function `plan_avoidance_maneuver` checks whether the satellite requires a avoidance maeuver or not.
    The outputs of the function are as follows:
    - missdistance - The minimum distance between the satellite and debris
    - tca - The time of closest Approach
    - isRequired - logical value of 1 if the maneuver is required and 0 if maneuver is not required

- `preManeuver.m`

    The function `preManeuver` takes a debris tle file as input. It uses the `plan_avoidance_maneuver` function to check if a maeuver is required. The function also calculates the position and velocity of the satellite at the time of closest approach (tca - output from `plan_avoidance_maneuver`). The ouputs of the function are as follows:
    - pos - Position of the satellite at maneuverStartTime
    - velocity - Velocity of the satellite at maneuverStartTime
    - maneuverStartTime - 30 minutes before the tca
    - missDistance and tca carried from the previous function

- `maneuver.m`

    The function `maneuver` 

Functions Used

- `preManeuver.m`
- `plan_avoidance_maneuver.m`
- `maneuver.m`

📂 `src/avoidance/`

#### e) Post-Maneuver Propagation

Re-propagates satellite orbit after maneuver and reassesses conjunction.

Function Used

- `postManeuver.m`

📂 `src/avoidance/`


5️⃣ Results Output

```matlab
fprintf("Time of Closest Approach (TCA) : %s\n", TCA);
fprintf("Before maneuver the miss distance at TCA : %.3f km\n", missDistanceBeforeManeuver/1000);
fprintf("After maneuver the miss distance at TCA : %.3f km\n", missDistanceAfterManeuver/1000);
```
Purpose

- Displays quantitative improvement in collision safety

- Enables before-and-after comparison of miss distances

#### High-Level Execution Flow
```text
run.m
 └── postManeuver()
      ├── createScenario()
      ├── orbit propagation (satellite + debris)
      ├── conjunction detection
      ├── miss distance computation (before maneuver)
      ├── avoidance maneuver planning
      ├── maneuver execution
      ├── re-propagation
      └── miss distance computation (after maneuver)
```

# Demo/Results
Add a video or animated gif/picture to showcase the code in operation and/or the expected results.
  
# Reference
Add reference papers, data, or supporting material that has been used, if any.
