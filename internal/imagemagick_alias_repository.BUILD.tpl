load("@rules_imagemagick//internal:util.bzl", "imagemagick_binary_alias")

package(default_visibility = ["//visibility:public"])

# Executables that exist on all platforms
imagemagick_binary_alias("compare")
imagemagick_binary_alias("composite")
imagemagick_binary_alias("conjure")
imagemagick_binary_alias("convert")
imagemagick_binary_alias("identify")
imagemagick_binary_alias("magick")
imagemagick_binary_alias("mogrify")
imagemagick_binary_alias("montage")
imagemagick_binary_alias("stream")
