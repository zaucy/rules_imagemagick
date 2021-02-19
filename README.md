# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-d9688bde0fa384c5896f111403435cac84fac225",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/d9688bde0fa384c5896f111403435cac84fac225.zip"],
    sha256 = "3dd932929e28821f63df529c4dd825326b2be32b3d4ebfd017bb6199cf3a58ee",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
