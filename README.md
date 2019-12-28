# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-f8755fd2ec7d1271bd11a3a817af35225cb4f858",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/f8755fd2ec7d1271bd11a3a817af35225cb4f858.zip"],
    sha256 = "e48640e20a8f2c39548fb1fe86aa7e476e906031412d5036c7f71b0731c7b062",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
