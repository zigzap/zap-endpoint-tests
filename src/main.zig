const std = @import("std");
const zap = @import("zap");
const Endpoint = @import("endpoint.zig");
const builtin = @import("builtin");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{
        .thread_safe = true,
    }){};
    var allocator = gpa.allocator();

    // setup listener
    var listener = zap.SimpleEndpointListener.init(
        allocator,
        .{
            .port = 3000,
            .on_request = null,
            .log = true,
            .public_folder = "python/static",
            .max_clients = 100000,
            .max_body_size = 100 * 1024 * 1024,
        },
    );

    Endpoint.init(allocator, "/users");

    // add endpoints
    try listener.addEndpoint(Endpoint.getUserEndpoint());

    // fake some users
    // var uid: usize = undefined;
    // uid = try Endpoints.getUsers().addByName("renerocksai", null);
    // uid = try Endpoints.getUsers().addByName("renerocksai", "your mom");

    // listen
    try listener.listen();

    std.debug.print("Listening on 0.0.0.0:3000\n", .{});

    // and run
    zap.start(.{
        .threads = 2000,
        .workers = 1,
    });
}
