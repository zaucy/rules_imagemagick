# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-9ad2fb8cdc803ac1a76e1026abdff583396f523c",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/9ad2fb8cdc803ac1a76e1026abdff583396f523c.zip"],
    sha256 = "27c5a992c04964555055fc3c41fdca44a036d5983e845b5d68c467136bc0af52",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
