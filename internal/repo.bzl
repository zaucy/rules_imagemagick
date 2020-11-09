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
        urls = [
            "https://imagemagick.org/download/binaries/ImageMagick-7.0.10-37-portable-Q16-x64.zip",
        ],
        sha256 = "49011cf7894048661bc31495fa2296b4d96f461f4c3b40f0a52ab79bbe88b487",
        build_file_content = _imagemagick_build_file_content,
    )

    http_archive(
        name = "imagemagick_win32",
        urls = [
            "https://imagemagick.org/download/binaries/ImageMagick-7.0.10-37-portable-Q16-x86.zip",
        ],
        sha256 = "30bc54dd5b2d964797011597137fea207f1e2648869e587ec6888a6bd72028ad",
        build_file_content = _imagemagick_build_file_content,
    )

    _imagemagick_linux_repo(
        name = "imagemagick_linux"
    )

    http_archive(
        name = "imagemagick_darwin",
        strip_prefix = "ImageMagick-7.0.10",
        urls = [
            "https://imagemagick.org/download/binaries/ImageMagick-x86_64-apple-darwin19.6.0.tar.gz",
        ],
        sha256 = "06d6aaddd0694cfd41add757043b4f0cf536367dea4d5d174eecf2da9d48cd8e",
        build_file_content = _imagemagick_build_file_content,
    )

    imagemagick_alias_repository(
        name = "imagemagick",
        build_file = "@rules_imagemagick//internal:imagemagick_alias_repository.BUILD.tpl",
    )
