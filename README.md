# Volta Control Suite (VCS)

This application supports the following power module interfaces:

1. HPS-17000
2. Simulated

The code was developed in LabVIEW 2023 (64-bit) and has the following dependencies:

1.  JKI State Machine
2.  JKI JSON

## HMI

- 1024x768 touch panel friendly interface
- TDMS Logging + File Viewer
- ACIR/EIS + DCIR/HPPC Testing and Report Generation

<img width="1034" height="809" alt="image" src="https://github.com/user-attachments/assets/ccd56967-4ee1-4b89-bf61-1933973af08c" />

## Module

TODO

## Chart

- Pause the live chart to zoom in and analyze waveforms
- Save the chart data to Excel for viewing later


## Config

- Configure Single or Multi Cycler Network settings
- Search for HPS17K units on the local network
- Configure panel-specific settings for graph, logging, and profile execution

## Control

- Manually control setpoints and toggle energization and output

## EIS

Configure EIS profiles to be executed on the cycler.  After execution is complete, generate corresponding nyquist and bode plots to analyze impedance data.

## Profile

Load CSV test profiles to be executed on the power module with setpoint streams.
