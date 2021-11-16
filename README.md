# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-35903509e561bde7b9081e5682a732d2f4d91f85",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/35903509e561bde7b9081e5682a732d2f4d91f85.zip"],
    sha256 = "20ce414b1243c28e388d7f56aaedebb2a0d5cf510fcd91bb5ceae77005b478fa",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repository")
imagemagick_repository()
```

## License

MIT
