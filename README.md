# 8-bit ALU RTL-to-GDS Implementation

## 📌 Project Overview

This project demonstrates a complete **ASIC RTL-to-GDSII implementation flow** for an **8-bit Arithmetic Logic Unit (ALU)** using open-source EDA tools.

The project starts with RTL design and proceeds through synthesis, floorplanning, placement, clock tree synthesis, routing, timing analysis, physical verification, and GDSII generation using the **OpenLane ASIC flow** and the **Sky130 PDK**.

The objective of this project is to gain practical understanding of the complete digital ASIC physical design flow.

---

## 🎯 Project Objectives

* Design and implement an 8-bit ALU in Verilog HDL
* Verify RTL functionality through simulation
* Perform logic synthesis
* Generate physical floorplan
* Perform power distribution network generation
* Execute placement and optimization
* Perform Clock Tree Synthesis (CTS)
* Perform global and detailed routing
* Perform Static Timing Analysis (STA)
* Run DRC and LVS verification
* Generate final GDSII layout

---

# 🏗️ Architecture

The 8-bit ALU performs arithmetic and logical operations on two 8-bit input operands.

### Inputs

| Signal      |        Width | Description           |
| ----------- | -----------: | --------------------- |
| A           |        8-bit | First operand         |
| B           |        8-bit | Second operand        |
| ALU Control | Control bits | Selects ALU operation |

### Outputs

| Signal |   Width | Description                 |
| ------ | ------: | --------------------------- |
| Result |   8-bit | ALU operation result        |
| Flags  | Control | Status flags if implemented |

### Supported Operations

The ALU architecture can perform operations such as:

* Addition
* Subtraction
* Bitwise AND
* Bitwise OR
* Bitwise XOR
* Logical Shift Left
* Logical Shift Right
* Comparison operations

---

# 📂 Project Structure

```text
alu_8bit/
│
├── src/
│   └── alu_8bit.v
│
├── tb/
│   └── alu_8bit_tb.v
│
├── openlane/
│   ├── config.json
│   │
│   └── runs/
│       └── RUN_2026-08-20_16-12-00/
│           ├── final/
│           ├── reports/
│           ├── logs/
│           └── ...
│
├── README.md
│
└── LICENSE
```

---

# 🔄 RTL-to-GDSII Flow

The complete ASIC implementation flow followed in this project is:

```text
                ┌─────────────────┐
                │   RTL Design    │
                │    Verilog      │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │ RTL Simulation  │
                │   & Verification│
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │ Logic Synthesis │
                │     Yosys       │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │   Floorplanning │
                │     OpenROAD    │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │ Power Planning  │
                │      PDN        │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │    Placement    │
                │ Global + Detail │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │ Clock Tree      │
                │ Synthesis (CTS) │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │     Routing     │
                │ Global + Detail │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │ Static Timing   │
                │ Analysis (STA)  │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │ Physical Verify │
                │ DRC / LVS / XOR │
                └────────┬────────┘
                         │
                         ▼
                ┌─────────────────┐
                │  Final GDSII    │
                └─────────────────┘
```

---

# 🛠️ Tools Used

| Tool           | Purpose                        |
| -------------- | ------------------------------ |
| Verilog        | RTL Design                     |
| Icarus Verilog | RTL Simulation                 |
| GTKWave        | Waveform Analysis              |
| Yosys          | Logic Synthesis                |
| OpenROAD       | Physical Design                |
| OpenSTA        | Static Timing Analysis         |
| OpenLane       | Automated RTL-to-GDS Flow      |
| Magic          | Layout Generation & DRC        |
| KLayout        | Layout Viewing & DRC           |
| Netgen         | LVS Verification               |
| Sky130 PDK     | Open-source Process Design Kit |

---

# ⚙️ OpenLane Flow Stages

The project successfully progressed through the major OpenLane stages.

## 1. RTL Synthesis

The Verilog RTL is synthesized into a gate-level netlist using **Yosys**.

```text
RTL Verilog
     ↓
Yosys Synthesis
     ↓
Gate-Level Netlist
```

---

## 2. Floorplanning

Floorplanning determines:

* Die area
* Core area
* IO placement
* Standard cell utilization
* Initial physical dimensions

### Reported Area Metrics

| Metric             |       Value |
| ------------------ | ----------: |
| Die Area           | 4226.88 µm² |
| Core Area          | 2254.66 µm² |
| Standard Cell Area | 1227.43 µm² |
| Macro Area         |       0 µm² |

---

## 3. Power Distribution Network

A power distribution network is generated to distribute:

* VDD
* VSS

across the design.

```text
VDD Ring / Straps
        │
        ▼
 Standard Cells
        │
        ▼
 VSS Network
```

---

## 4. Placement

The synthesized standard cells are placed inside the defined core area.

Placement stages include:

* Global Placement
* Placement Optimization
* Detailed Placement

The objective is to reduce:

* Wirelength
* Congestion
* Timing violations

---

## 5. Clock Tree Synthesis

Clock Tree Synthesis distributes the clock signal to sequential elements while controlling:

* Clock skew
* Clock latency
* Clock transition

---

## 6. Routing

Routing connects all placed standard cells.

### Routing Stages

```text
Global Routing
      ↓
Detailed Routing
      ↓
DRC Optimization
```

The routing stage creates the physical metal connections required to implement the design.

---

## 7. Static Timing Analysis

Static Timing Analysis was performed across multiple PVT corners.

### PVT Corners

* Typical-Typical: `nom_tt_025C_1v80`
* Slow-Slow: `nom_ss_100C_1v60`
* Fast-Fast: `nom_ff_n40C_1v95`

---

# ⏱️ Timing Results

The reported timing metrics show analysis across multiple corners.

### Typical Corner

**nom_tt_025C_1v80**

| Metric           |    Value |
| ---------------- | -------: |
| Setup Slack      | Positive |
| Hold Slack       |   4.0688 |
| Setup Violations |        0 |
| Hold Violations  |        0 |

---

### Fast Corner

**nom_ff_n40C_1v95**

| Metric           | Value |
| ---------------- | ----: |
| Setup WNS        |     0 |
| Setup TNS        |     0 |
| Hold WNS         |     0 |
| Hold TNS         |     0 |
| Setup Violations |     0 |
| Hold Violations  |     0 |

---

### Slow Corner

**nom_ss_100C_1v60**

The intermediate flow reports a setup timing violation:

| Metric                |   Value |
| --------------------- | ------: |
| Setup Slack           | -0.5202 |
| Setup TNS             | -0.5202 |
| Setup Violation Count |       1 |
| Hold Slack            |  4.2989 |
| Hold Violations       |       0 |

> Note: The slow corner represents a worst-case operating condition. Timing optimization and constraint refinement can be performed as future work to improve setup timing closure.

---

# 📐 Area Results

The physical design generated the following area metrics:

```text
Die Area          : 4226.88 µm²
Core Area         : 2254.66 µm²
Standard Cell Area: 1227.43 µm²
Macro Area        : 0 µm²
```

---

# 🔍 Physical Verification

The following physical verification stages were executed:

## Magic DRC

Design Rule Checking verifies whether the layout follows manufacturing design rules.

```text
Magic DRC
```

---

## KLayout DRC

Additional layout verification was performed using KLayout.

```text
KLayout DRC
```

---

## LVS Verification

Layout Versus Schematic verification checks whether the extracted layout matches the intended circuit connectivity.

```text
Netgen LVS
```

---

## XOR Check

XOR comparison verifies consistency between generated layout representations.

---

# 🧪 Manufacturing Checks

The OpenLane flow also executed additional checks including:

* Antenna property checks
* Illegal overlap checks
* Setup violation checks
* Hold violation checks
* Maximum slew checks
* Maximum capacitance checks
* Manufacturability reporting

---

# 📊 Complete ASIC Implementation Summary

```text
RTL Design
   │
   ▼
RTL Simulation
   │
   ▼
Logic Synthesis
   │
   ▼
Floorplanning
   │
   ▼
Power Planning
   │
   ▼
Placement
   │
   ▼
CTS
   │
   ▼
Routing
   │
   ▼
Static Timing Analysis
   │
   ▼
DRC Verification
   │
   ▼
LVS Verification
   │
   ▼
GDSII Generation
```

---

# 🧠 Key Learning Outcomes

Through this project, I gained practical exposure to:

* Verilog RTL design
* Digital logic implementation
* RTL simulation
* Logic synthesis
* Standard cell libraries
* Physical floorplanning
* Power distribution networks
* Cell placement
* Clock Tree Synthesis
* Global and detailed routing
* Static Timing Analysis
* PVT corner analysis
* Setup and hold timing concepts
* DRC verification
* LVS verification
* GDSII generation
* Complete RTL-to-GDS ASIC flow

---

# 🚀 Future Improvements

Future improvements for this project include:

* Improve worst-case setup timing
* Optimize ALU architecture for area
* Reduce critical path delay
* Add power analysis
* Perform IR drop optimization
* Compare different synthesis strategies
* Perform congestion analysis
* Add more ALU operations
* Integrate the ALU into a RISC-V processor datapath

---

# 📌 Technology

* **PDK:** Sky130
* **Design Type:** Digital ASIC
* **RTL Language:** Verilog
* **Implementation Flow:** OpenLane
* **Physical Design Tool:** OpenROAD

---

# 👨‍💻 Author

**Piyush Kumar Yadav**

ECE Engineer | RTL Design | Digital VLSI | Physical Design Enthusiast

---

# ⭐ Project Status

✅ RTL Design Completed
✅ RTL Simulation Completed
✅ Logic Synthesis Completed
✅ Floorplanning Completed
✅ Power Planning Completed
✅ Placement Completed
✅ Routing Completed
✅ Static Timing Analysis Performed
✅ DRC Flow Executed
✅ LVS Flow Executed
✅ GDSII Generation Completed

---

## 📜 Conclusion

This project demonstrates a complete open-source **RTL-to-GDSII ASIC design flow** using an 8-bit ALU as the target design.

The implementation covers the major stages of modern digital ASIC design, starting from Verilog RTL and ending with physical verification and layout generation. The project provides practical exposure to industry-relevant tools and concepts used in VLSI physical design.

This project serves as a foundation for larger ASIC designs such as processors, SoCs, and RISC-V based systems.
