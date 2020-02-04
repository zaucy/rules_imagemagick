load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_imagemagick_build_file_content = """
package(default_visibility = ["//visibility:public"])
exports_files(glob(["**/*"]))
"""

def _imagemagick_alias_repository(rctx):
    rctx.template(rctx.path("BUILD.bazel"), rctx.attr.build_file)

imagemagick_alias_repository = repository_rule(
    implementation = _imagemagick_alias_repository,
    local = True,
    attrs = {
        "build_file": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
    },
)

def imagemagick_repositories():
    http_archive(
        name = "imagemagick_win64",
        urls = [
            "https://imagemagick.org/download/binaries/ImageMagick-7.0.9-21-portable-Q16-x64.zip",
        ],
        sha256 = "9a6a0d9da37667e975384ba275537a268447d1eea5d4dfb2f0b9c89d01e4a3d7",
        build_file_content = _imagemagick_build_file_content,
    )

    http_archive(
        name = "imagemagick_win32",
        urls = [
            "https://imagemagick.org/download/binaries/ImageMagick-7.0.9-21-portable-Q16-x86.zip",
        ],
        sha256 = "c6619c4b6ca896adc14fdd4872483f75f4d9121bf22bbf7e65e2d031304b6f72",
        build_file_content = _imagemagick_build_file_content,
    )

    http_archive(
        name = "imagemagick_darwin",
        strip_prefix = "ImageMagick-7.0.9",
        urls = [
            "https://imagemagick.org/download/binaries/ImageMagick-x86_64-apple-darwin19.2.0.tar.gz",
        ],
        sha256 = "a6d5a2c605932fe70c40039fff6660bd38c27496827d4b9c92c0c1206ba3a108",
        build_file_content = _imagemagick_build_file_content,
    )

    imagemagick_alias_repository(
        name = "imagemagick",
        build_file = "@rules_imagemagick//internal:imagemagick_alias_repository.BUILD.tpl",
    )
