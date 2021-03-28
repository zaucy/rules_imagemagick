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

def _imagemagick_linux_repo_rule_impl(rctx):
    rctx.file("BUILD.bazel", executable = False, content = _imagemagick_build_file_content)
    rctx.download(
        "https://imagemagick.org/download/binaries/magick",
        output = "magick",
        executable = True,
        allow_fail = False,
    )

_imagemagick_linux_repo = repository_rule(
    implementation = _imagemagick_linux_repo_rule_impl,
)

def imagemagick_repositories():
    http_archive(
        name = "imagemagick_win64",
        urls = ["https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.11-5-portable-Q16-x64.zip"],
        sha256 = "fc3402bc8efcd29537fb803abd08a892e966c57f83eccde4ccc853da2f0b9ac3",
        build_file_content = _imagemagick_build_file_content,
    )

    http_archive(
        name = "imagemagick_win32",
        urls = ["https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-7.0.11-5-portable-Q16-x86.zip"],
        sha256 = "9fb064a1c39cab895cb977ab6f49390cd773a810df1f69d7c2f2182731581b86",
        build_file_content = _imagemagick_build_file_content,
    )

    _imagemagick_linux_repo(
        name = "imagemagick_linux"
    )

    http_archive(
        name = "imagemagick_darwin",
        strip_prefix = "ImageMagick-7.0.11",
        urls = ["https://download.imagemagick.org/ImageMagick/download/binaries/ImageMagick-x86_64-apple-darwin20.1.0.tar.gz"],
        sha256 = "",
        build_file_content = _imagemagick_build_file_content,
    )

    imagemagick_alias_repository(
        name = "imagemagick",
        build_file = "@rules_imagemagick//internal:imagemagick_alias_repository.BUILD.tpl",
    )
