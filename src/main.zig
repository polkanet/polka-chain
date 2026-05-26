const std = @import("std"); // Standard library. Containing utilities for memory management, debugging, etc.
const Sha256 = std.crypto.hash.sha2.Sha256; // Sha256 is the encryption library used for the encrypting and decrypting.

// Block: struct, structure of a block.
const Block = struct {
    // Use this index to keep track of the block's
    // position in the blockchain.
    index: u64, // The block index.
    timestamp: i64, // the timestamp
    prev_hash: [32]u8, // the previous hash
    nonce: u64, // a number used once
    hash: [32]u8, // current hash
};

fn calculateHash(block: Block) [32]u8 {
    var hasher = Sha256.init(.{}); // Initialize the SHA-256 hasher.

    hasher.update(std.mem.asBytes(&block.index)); // Update hasher with the block index.
    hasher.update(std.mem.asBytes(&block.timestamp)); // Update hasher with the block timestamp.
    hasher.update(&block.prev_hash); // Update hasher with the previous block's hash.
    hasher.update(std.mem.asBytes(&block.nonce)); // Update hasher with the block nonce.

    // varible output is defined as an array of 32 bytes.
    // The output buffer is then intialized as undefined, which means
    // it stores uninitialized data.
    var out: [32]u8 = undefined; // Output buffer
    hasher.final(&out); // Finalize the hasher with the final output.
    // The empty, undefined output buffer is passed to the final function,
    // which fills it with the computed hash value.
    return out; // Return the computed hash of the block.
}

fn createGenesisBlock() Block { // We need to pass in block because
    // we need to calculate the hash of the block, which requires the block's fields
    // to be defined.
    var block = Block{
        .index = 0,
        .timestamp = 0,
        .prev_hash = [_]u8{0} ** 32, // no previous block
        .nonce = 0,
        .hash = undefined,
    };

    block.hash = calculateHash(block);
    return block;
}

pub fn main() void {
    // Just some prints - regarding the project.
    std.debug.print("Polka L1 Blockchain\n", .{});

    // Call the createGenesisBlock function.
    const genesis = createGenesisBlock();

    std.debug.print("Genesis Block:\n", .{});
    std.debug.print("Index: {d}\n", .{genesis.index});
    std.debug.print("Timestamp: {d}\n", .{genesis.timestamp});
    std.debug.print("Hash: {x}\n", .{genesis.hash});
}
