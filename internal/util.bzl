def imagemagick_binary_alias(executable_name):
    native.alias(
        name = executable_name,
        actual = select({
            # "@bazel_tools//src/conditions:linux_x86_64": "",
            "@bazel_tools//src/conditions:darwin_x86_64": "@imagemagick_darwin//:bin/{}".format(executable_name),
            "@bazel_tools//src/conditions:darwin": "@imagemagick_darwin//:bin/{}".format(executable_name),
            "@bazel_tools//src/conditions:host_windows": "@imagemagick_win64//:{}.exe".format(executable_name),
            "@bazel_tools//src/conditions:host_windows_msvc": "@imagemagick_win64//:{}.exe".format(executable_name),
            "@bazel_tools//src/conditions:host_windows_msys": "@imagemagick_win64//:{}.exe".format(executable_name),
        }),
    )
