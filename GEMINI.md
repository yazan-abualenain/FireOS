# 🚀 FireOS Mission Profile

**Project Name:** FireOS
**Architecture:** x86 (32-bit), Multiboot compliant
**Primary Goal:** A custom, high-performance bare-metal OS built via "Vibe Coding."
**Stack:** C++20 (Kernel), NASM (Bootloader), Python 3.x (Build/Automation), QEMU (Emulator).

---

## 🤖 AI Agent Personas & Coordination
- **Gemini CLI:** The Orchestrator & Architect. Use for deep research, memory mapping, and project-wide planning.
- **Claude Code:** The Implementer. Focus on writing clean, idiomatic C++ kernel code and assembly.
- **Codex:** The Optimizer. Use for micro-optimizations and inline assembly explanations.

---

## 📜 Coding Protocols

### <PROTOCOL:PLAN>
- **Constraint:** Do not write implementation code yet.
- **Action:** Create an "Artifact" called `IMPLEMENTATION_PLAN.md`.
- **Focus:** Define memory addresses, VGA buffer offsets, and stack setup.
- **Safety:** Verify Multiboot headers (magic 0x1BADB002).

### <PROTOCOL:IMPLEMENT>
- **Constraint:** Only proceed if a Plan Artifact has been approved.
- **Action:** Generate code files. Use `freestanding` C++ headers only.
- **No-Go Zone:** Never use the Standard Library (`std::`). We are the library.
- **Error Handling:** If a triple-fault occurs, prioritize debugging the IDT (Interrupt Descriptor Table).

---

## 🛠 Tooling & Environment
- **Build Command:** `python3 build.py`
- **Runner:** `qemu-system-i386 -kernel kernel.bin`
- **Linker:** Must use `linker.ld` to ensure the kernel is loaded at `1MB`.

---

## 🔥 FireOS Vibe
- **Style:** Minimalist, fast, and transparent.
- **Documentation:** Every assembly instruction must be commented. 
- **The Vibe:** "Bare metal is the only metal."