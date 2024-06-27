const std = @import("std");

pub fn build(b: *std.Build) !void {
    // options:
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // can not (or i did not find how to) make a "dumb" module to just export headers
    // so instead, let's make an empty static lib, which does have those headers
    const lib = b.addStaticLibrary( .{
        .name = "cmsis_device_h7rs",
        .target = target,
        .optimize = optimize,
        .root_source_file = b.path("empty.zig"),
    });

    lib.installHeadersDirectory(b.path("Include"), "", .{});
    b.installArtifact(lib);
}
