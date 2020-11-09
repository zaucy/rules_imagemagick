# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-076d8d8720698f7ac7712b458d02625bcfcaece7",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/076d8d8720698f7ac7712b458d02625bcfcaece7.zip"],
    sha256 = "5f17d958489c0286587717f373a816d9663a7178017ba47a5ee818fe118f8692",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
