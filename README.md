# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-46b3378da2ab5e3b596a75c302ab91db5caef1ad",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/46b3378da2ab5e3b596a75c302ab91db5caef1ad.zip"],
    sha256 = "11c1fa9c7f9e67357ab0a52ffe97ed355f1a9e72f616923d491a6a718271d9bf",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
