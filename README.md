# Polka L1 Blockchain

NOT DONE!

Polka is a high-performance Layer 1 blockchain built entirely in **Zig**. It is designed for extreme predictability, deterministic execution, and maximum hardware utilization.

## Unique Tech Stack

- **Language**: [Zig](https://ziglang.org/) - chosen for its lack of hidden control flow, explicit memory management, and powerful `comptime` features.
- **Consensus**: **Lumina BFT** - a custom variant of the pipelined HotStuff algorithm.
- **Virtual Machine**: **AetherVM** - a bespoke register-based bytecode interpreter designed for blockchain syscalls.
- **Storage**: **Stardust-LSM** - a custom Log-Structured Merge-tree storage engine optimized for Merkle-Patricia tries.

## Getting Started

### Prerequisites

- [Zig 0.13.0](https://ziglang.org/download/) or newer.

### Building

```bash
zig build
```

### Running

```bash
./zig-out/bin/polka start
```

### Testing

```bash
zig build test
```

## Project Structure

- `src/main.zig`: Application entry point and CLI handler.
- `src/node/`: Core node logic and consensus engine.
- `src/net/`: P2P networking and gossip protocols.
- `src/vm/`: The PolkaVM execution engine.
- `src/storage/`: State storage and indexed block database.
- `src/crypto/`: Hashing and signature verification.
