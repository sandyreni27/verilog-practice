# verilog-practice
basics
# Verilog Practice

Self-teaching Verilog and digital hardware design with the goal of FPGA/ASIC engineering.

## Week 1 — Basic Logic Gates + Adders

| Module | Description |
|--------|-------------|
| and_gate.v | 2-input AND gate |
| or_gate.v | 2-input OR gate |
| not_gate.v | Single input NOT gate |
| nand_gate.v | 2-input NAND gate |
| nor_gate.v | 2-input NOR gate |
| xor_gate.v | 2-input XOR gate |
| mux_2to1.v | 2-to-1 Multiplexer |
| half_adder.v | Half Adder (sum + carry) |
| full_adder.v | Full Adder (sum + carry + carry_in) |
| ripple_carry_adder_4bit.v | 4-bit Ripple Carry Adder |

# 🔵 Verilog Practice — Week 2

Self-study Verilog modules as part of my VLSI learning roadmap.
Tools: EDA Playground | References: Neso Academy, HDLBits

---

## 📁 Modules

| File | Module | Type |
|------|--------|------|
| `4_bit_alu.v` | 4-bit ALU | Combinational |
| `d_flipflop.v` | D Flip-Flop | Sequential |
| `jk_sr_flipflop.v` | JK & SR Flip-Flop | Sequential |
| `shift_reg.v` | Shift Register | Sequential |
| `up_down_counter.v` | Up/Down Counter | Sequential |
| `sequence_detector.v` | Sequence Detector (FSM) | Sequential / FSM |

---

## 🧠 Concepts Covered

- Combinational logic: ALU operations (ADD, SUB, AND, OR, XOR)
- Latches vs Flip-Flops: SR, D, JK
- Registers: SIPO / PISO shift register
- Counters: Synchronous up/down counter with enable & reset
- FSM: Mealy/Moore sequence detector



*Week 1 → Gate-level basics | Week 2 → Dataflow & behavioral modeling*

## Tools
- Simulator: EDA Playground (Icarus Verilog 12.0)
- Language: Verilog/SystemVerilog

## Goal
FPGA/ASIC engineering — working toward hardware design at the level of NVIDIA.
