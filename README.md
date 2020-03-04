# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-55fe0c69189a0bdec2b97f119c1b463a6e0e28b1",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/55fe0c69189a0bdec2b97f119c1b463a6e0e28b1.zip"],
    sha256 = "fdd25375ecb08222e75479247c998f8760658e8d8fd2ccafd39921f7f676645e",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
