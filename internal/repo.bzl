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
            "https://imagemagick.org/download/binaries/ImageMagick-7.0.10-24-portable-Q16-x64.zip",
        ],
        sha256 = "9d5f8f6e5fa5ae03173c1e2c86f6d7d7b32b71605e4a01f6f9270035fc510d88",
        build_file_content = _imagemagick_build_file_content,
    )

    http_archive(
        name = "imagemagick_win32",
        urls = [
            "https://imagemagick.org/download/binaries/ImageMagick-7.0.10-24-portable-Q16-x86.zip",
        ],
        sha256 = "e3aae1cc439670cfdda3b1a41423396cebdb15a7c657e9227f25f4f107ce3512",
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
