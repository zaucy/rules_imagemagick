# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-900584aaf8796f602e96ccf9250d2d44097b8cdf",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/900584aaf8796f602e96ccf9250d2d44097b8cdf.zip"],
    sha256 = "5d59e3ec8fa4ffe31d00f3b8e61599d5ab0212c4aa985c990328986737cb4942",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
