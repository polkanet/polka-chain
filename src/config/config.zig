const std = @import("std");

pub const Config = struct {
    // Network Configuration
    pub const Network = struct {
        pub const Mainnet = struct {
            pub const ChainID: u64 = 1; // Unique identifier for the main network.
            pub const Name: []const u8 = "Mainnet"; // Main network for production use.
        };
        pub const Testnet = struct {
            pub const ChainID: u64 = 2; // Unique identifier for the test network.
            pub const Name: []const u8 = "Testnet"; // Test network for development and testing.
        };
        pub const Devnet = struct {
            pub const ChainID: u64 = 3; // Unique identifier for the development network.
            pub const Name: []const u8 = "Devnet"; // Development network for local development.
        };
        // TODO: Add more chain types.
    };
};
