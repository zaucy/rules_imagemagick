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
            "https://imagemagick.org/download/binaries/ImageMagick-7.0.10-1-portable-Q16-x64.zip",
        ],
        sha256 = "88525669fdc764ad25a8295abb63f6d8a6ba76470ef6112994147578124a6a86",
        build_file_content = _imagemagick_build_file_content,
    )

    http_archive(
        name = "imagemagick_win32",
        urls = [
            "https://imagemagick.org/download/binaries/ImageMagick-7.0.10-1-portable-Q16-x86.zip",
        ],
        sha256 = "8563261ad193b95d23707c6be9af3f5dcb2f0be92890fb4bdb660ac2d1bbb474",
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
