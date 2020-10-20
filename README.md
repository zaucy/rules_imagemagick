# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-fda1b8ff5214648bd581dc2ca9a5ad0d20136761",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/fda1b8ff5214648bd581dc2ca9a5ad0d20136761.zip"],
    sha256 = "",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
