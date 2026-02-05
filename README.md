# CNN-accelarator-using-verilog
High-Performance Design and Verification of a Hardware-Optimized CNN Accelerator for Real-Time Object Detection Using YOLOv3 with Darknet-19 Architecture
# Hardware-Optimized CNN Accelerator for Real-Time Object Detection  
## YOLOv3 with Darknet-19 Architecture

## Overview
This project presents a high-performance hardware accelerator for Convolutional Neural Networks (CNNs), specifically optimized for the Darknet-19 backbone used in the YOLOv3-Tiny object detection algorithm. The architecture is implemented in Verilog HDL and designed for FPGA/ASIC platforms to enable real-time object detection with reduced latency and power consumption.

The accelerator performs key CNN operations such as convolution, pooling, and activation using parallel processing, significantly improving performance compared to traditional CPU or GPU implementations.

---

## Key Features
- Hardware-optimized CNN accelerator
- Darknet-19 backbone for YOLOv3-Tiny
- Real-time object detection capability
- Parallel convolution processing
- Booth multiplier-based MAC units
- RTL to GDSII ASIC design flow
- Area, power, and timing analysis

---

## Project Objectives
- Design a CNN accelerator optimized for Darknet-19
- Implement convolution, pooling, and activation layers in hardware
- Reduce latency and power consumption
- Enable real-time object detection on edge devices
- Perform full ASIC design flow from RTL to layout

---

## System Architecture
The system consists of three main stages:

### 1. Image Preprocessing
- Image resizing
- Pixel normalization
- Channel formatting (RGB processing)

### 2. Hardware CNN Accelerator
Core hardware module implemented in Verilog:
- Control and status unit
- Input buffer
- Convolution layers
- Batch normalization
- ReLU activation
- Max-pooling layers

### 3. YOLOv3 Detection Module
- Feature map generation
- Bounding box prediction
- Class probability estimation
- Non-Maximum Suppression (NMS)
- Final object detection output

---

## CNN Layer Operations

### Convolution Layer
- Extracts features like edges and textures
- Uses multiple filters across input channels
- Implemented with parallel processing elements

### Pooling Layer
- Reduces feature map size
- Improves robustness to small input variations
- Uses max pooling operations

### Activation Layer
- ReLU activation:  
  `f(x) = max(0, x)`
- Introduces nonlinearity for complex pattern learning

---

## Multiplier Architecture
The accelerator uses a **Modified Booth Multiplier**:

Advantages:
- Efficient signed multiplication
- Reduced partial products
- Lower power consumption
- Reduced critical path delay
- Higher clock frequency operation

This improves the performance of the multiply-accumulate (MAC) operations used in convolution layers.

---

## Tools and Technologies
- **Verilog HDL** – RTL design
- **Xilinx Vivado** – Simulation and RTL verification
- **Synopsys Design Compiler** – Logic synthesis
- **Cadence Innovus** – Physical design (place and route)
- **MATLAB** – CNN verification and image processing
- **Nangate 45nm library** – Technology mapping

---

## ASIC Design Flow
1. RTL design in Verilog
2. Functional simulation (Vivado)
3. Logic synthesis (Design Compiler)
4. Area, power, and timing analysis
5. Physical design (Innovus)
6. Clock tree synthesis
7. Routing and DRC checks
8. Final chip layout
9. GDSII generation

---

## Results
- Successful functional verification of CNN accelerator
- Reduced power consumption compared to software CNN
- Optimized area using 45 nm CMOS technology
- Real-time object detection capability

---

## Applications
- Autonomous vehicles
- Smart surveillance systems
- Industrial automation
- Medical imaging devices
- Edge AI and IoT systems

---

## Future Improvements
- Quantized CNN implementation
- On-chip memory optimization
- Fully hardware-based YOLO detection head
- Support for deeper networks (Darknet-53)
- Integration with real-time camera input

---

## Author
**Manasa Kunapareddy**  
M.S. Electrical and Computer Engineering  
California State University, Fresno  
Advisor: Dr. Nan Wang

---

## License
This project is intended for academic and research purposes.
