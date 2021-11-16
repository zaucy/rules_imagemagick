_imagemagick_build_file_content = """
package(default_visibility = ["//visibility:public"])
alias(
    name = "magick",
    actual = "magick{bin_ext}",
)
"""

_imagemagick_fail_msg = """

from imagemagick_repository():
  ImageMagick must be installed and 'magick{bin_ext}' available in your PATH.
  Download ImageMagick here: https://imagemagick.org/script/download.php

"""

def _imagemagick_repository_impl(rctx):
    bin_ext = ""
    if rctx.os.name.lower().startswith("windows"):
        bin_ext = ".exe"

    magick = rctx.which("magick" + bin_ext)
    if not magick:
        fail(_imagemagick_fail_msg.format(bin_ext = bin_ext))
    rctx.symlink(magick, "magick" + bin_ext)
    rctx.file(
        "BUILD.bazel",
        content = _imagemagick_build_file_content.format(bin_ext = bin_ext),
        executable = False,
    )

_imagemagick_repository = repository_rule(
    implementation = _imagemagick_repository_impl,
    attrs = {},
)

def imagemagick_repository():
    _imagemagick_repository(name = "imagemagick")
