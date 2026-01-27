# FuncUseMetric
This repository provides two R functions, FuncUse and FuncUseRatio, designed to quantify functional use of the upper limb based on forearm orientation derived from accelerometer data.
# FuncUse and FuncUseRatio

This repository provides two R functions, **FuncUse** and **FuncUseRatio**, designed to quantify functional use of the upper limb based on forearm orientation derived from accelerometer data.

---

## Overview

- **FuncUse** computes a functional use score from forearm orientation signals by analyzing movement amplitude within a predefined orientation range.
- **FuncUseRatio** computes a normalized ratio between paretic and non-paretic arm functional use, providing a scalar value between -1 and 1.

These functions are intended for applications in motor control, biomechanics, and rehabilitation research.

---

## FuncUse

### Description

`FuncUse` evaluates whether forearm movements within fixed time epochs can be considered functional. A movement is defined as functional if:

1. The forearm orientation lies within a specified range around the horizontal position.
2. The movement amplitude within this range exceeds a predefined threshold.

Each epoch satisfying these criteria contributes a value of 1 to the final FuncUse score.

### Calling Sequence

```r
FuncUse(data, epoch = 2, SampleFrequency = 50, range = 50, amplitude = 15)
```

### Parameters

- **data**: Numeric vector containing forearm orientation data (in degrees) relative to the vertical. Orientation is typically computed from accelerometer signals as:
  
  α(t) = arccos(ay(t) / svm(t))

- **epoch**: Duration of the analysis window in seconds (default: 2).
- **SampleFrequency**: Sampling frequency of the signal in Hz (default: 50).
- **range**: Orientation range relative to the horizontal (90°) within which the movement is considered functional (default: ±50°).
- **amplitude**: Minimum required movement amplitude (in degrees) within the range for the movement to be considered functional (default: 15°).

### Output

- A scalar integer corresponding to the number of functional epochs detected in the signal.

---

## FuncUseRatio

### Description

`FuncUseRatio` computes a normalized functional use ratio between the paretic and non-paretic arms. The output is bounded between -1 and 1, facilitating inter-subject and inter-session comparisons.

### Calling Sequence

```r
FuncUseRatio(Paretic_FuncUse, Non_Paretic_FuncUse)
```

### Parameters

- **Paretic_FuncUse**: FuncUse score of the paretic arm (scalar).
- **Non_Paretic_FuncUse**: FuncUse score of the non-paretic arm (scalar).

### Output

- A scalar value between -1 and 1 representing the relative functional use of the paretic arm compared to the non-paretic arm.

---

## Example

```r
# Compute functional use for each arm
FU_paretic <- FuncUse(paretic_data)
FU_non_paretic <- FuncUse(non_paretic_data)

# Compute normalized functional use ratio
FU_ratio <- FuncUseRatio(FU_paretic, FU_non_paretic)
```

---

## Authors

Gael Le Perf

EuroMov Digital Health in Motion, Univ. Montpellier, IMT Mines Ales, Montpellier, France

Paul Coste-Floret Hospital, Lamalou-les-bains, France


Karima Bakthi

EuroMov Digital Health in Motion, Univ. Montpellier, IMT Mines Ales, Montpellier, France

University Hospital Center of Montpellier, France


Denis Mottet

EuroMov Digital Health in Motion, Univ. Montpellier, IMT Mines Ales, Montpellier, France

---

## Version

0.0.1 — 2025
