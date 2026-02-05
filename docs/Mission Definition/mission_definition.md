# Satellite Mission Definition

## Mission Type
 Earth Imaging Mission

 ---

## Mission Objective

To design and operate regionally focused Earth observation satellite that delivers high-resolution, timely, and actionable geospatial information to support agricultural productivity, urban planning, and disaster risk reduction in Tamil Nadu, thereby enabling a transition from reactive response to predictive and preventive governance.

---

## Name of the Stellite

YPSAT (Yield and Planning Satellite)

## Mission Definition

#### Epoch : December 21 2025, 12:00:00 AM
### Orbit Type

- Sun-Synchronous Orbit (SSO)
- Near circular, retrograde orbit optimized for consistent ligting and repeated coverage

#### Altitude (mean) : ~546 km

### Orbital Elements

#### Semi-major axis (a) : ~6917 km 

- Semi-major axis (a) = Mean Earth Radius + Orbital Altitude
- Mean Earth Radius = 6371 km
- Orbital Altiude = 546 km
- Semi-major axis (a) = 6371 + 546 = 6917 km

#### Eccentricity (e) : 0.001

- Earth Observation have near circular orbits. So we choose a value of 0.001

#### Inclination (i) : 97.4 $\degree$

- Earth Observation satellites have typical values of inclination in the range of 96 - 98 degrees. 
- Referring the CartoSat-2 we we choose 97.4 degrees as our inclination.

#### Right Ascension of Ascending Node ($\Omega$) : 337.5 $\degree$

Right Ascension of Ascending Node (RAAN) depends on Local Time of Ascending Node (LTAN)

For our mission we fix LTAN as 10:30 AM ensuring good lighting conditions. 

Relation between $\Omega$ and LTAN

$$
\Omega = \alpha_{⊙} + 15\degree \times (LTAN - 12)
$$

Where:
- $\Omega :$  RAAN (degrees)
- $\alpha_{⊙} :$ Right Ascension of the Sun (degrees)
- LTAN in hours
-  $15\degree$ per hour comes from Earth rotation

##### Determination of RAAN of Sun on our epoch

On December 21, we assume (for project convenience) Sun is at vernal equinox so $\alpha_{⊙} = 0\degree$

$$
\Omega = 0\degree + 15\degree \times (10.5 - 12)
$$

$$
\Omega = -22.5\degree
$$

RAAN is usually expressed between $0\degree$ and $360\degree$, so

$$
    \Omega = 337.5\degree
$$

#### Argument of Perigee : $0\degree$

#### True Anomaly : $180\degree$

---

### Derived Orbit Characteristics

#### Perigee and Apogee Altitudes

For near-circular orbit (e $\approx$ 0), but for realism we chose $e = 0.001$

$$
    r_p = a(1 - e) = 6917(1 - 0.001) = 6910 km \implies 539 km
$$

$$
    r_a = a(1 + e) = 6917(1 + 0.001) = 6924 km \implies 553 km
$$

Imaging satellites typically allow $\pm 5 - 10$ km variation

#### Orbital Period (T)

Kepler's Third Law:

$$
    T = 2\pi \sqrt{\frac{a^3}{\mu}}
$$

Earth gravitational parameter, $\mu = 398600 \text{ }km^3/s^2$

$$
    T = 2\pi \sqrt{\frac{(6924)^3}{3986000}}
$$

$$
    T \approx 95.6~\text{minutes}
$$

#### Mean Motion (n)

Mean motion is the average angular rate:

$$
    n = \frac{2\pi}{T}
$$

$$
    n = \frac{2\pi}{5736} = 0.001095 \text{ rad/s}
$$

In revolutions per day:

$$
    n = \frac{\text{Minutes in a day}}{\text{Minutes taken for single revolution (T)}} = \frac{1440}{95.6} \approx  15.06 \text{ rev/day}
$$

#### Orbital Velocity (v)

For a circular orbit:

$$
    v = \sqrt{\frac{\mu}{a}} = \sqrt{\frac{398600}{6917}} = 7.59 \text{ km/s}
$$


