const std = @import("std");
const crypto = std.crypto;
const Sha256 = crypto.hash.sha2.Sha256;
const genesis = @import("./util/genesis.zig");

// Calculate the hash of a specific block using its fields.
// This function takes a BlockGenesis struct as input and
// computes its hash by serializing its fields and then
// feeding them into the SHA-256 hasher. The resulting hash is
// returned as a 32-byte array.
fn calculateHash(block: genesis.BlockGenesis) [32]u8 {
    var hasher = Sha256.init(.{}); // Initialize the SHA-256 hasher with all default options.

    hasher.update(std.mem.asBytes(&block.index)); // Updates the hasher with the byte representation of the block's index.
    hasher.update(std.mem.asBytes(&block.timestamp)); // Updates the hasher with the byte representation of the block's timestamp.
    hasher.update(&block.prev_hash); // Updates the hasher with the previous block's hash, which is already a byte array.
    hasher.update(std.mem.asBytes(&block.nonce));

    var out: [32]u8 = undefined; // Undefined output buffer.
    hasher.final(&out); // Load the final thing in out.
    return out; // Return output.
}
