# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-f27f35fca2722ebf463c6209a3ba9ef85f2e58aa",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/f27f35fca2722ebf463c6209a3ba9ef85f2e58aa.zip"],
    sha256 = "5fbdda473beb1327c4b6c46fea636e336fa05e48902e584a11b36ef350c512de",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
