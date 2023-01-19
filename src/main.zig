const std = @import("std");
const zap = @import("zap");
const Endpoints = @import("endpoints.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    // setup listener
    var listener = zap.SimpleEndpointListener.init(
        allocator,
        .{
            .port = 3000,
            .on_request = null,
            .log = true,
            .public_folder = "python/static",
        },
    );

    Endpoints.init(allocator, "/users");

    // add endpoints
    try listener.addEndpoint(Endpoints.getUserEndpoint());

    // fake some users
    var uid: usize = undefined;
    uid = try Endpoints.getUsers().addByName("renerocksai", null);
    uid = try Endpoints.getUsers().addByName("renerocksai", "your mom");

    // listen
    try listener.listen();

    std.debug.print("Listening on 0.0.0.0:3000\n", .{});

    // and run
    zap.start(.{
        .threads = 10,
        .workers = 1,
    });
}
