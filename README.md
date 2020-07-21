# rules_imagemagick

[Bazel](https://bazel.build) rules for [ImageMagick](https://imagemagick.org/)

## Install

Add this to your `WORKSPACE`

```python
http_archive(
    name = "rules_imagemagick",
    strip_prefix = "rules_imagemagick-723ebd4ab52de331f9ba402fe6fba80919d589a3",
    urls = ["https://github.com/zaucy/rules_imagemagick/archive/723ebd4ab52de331f9ba402fe6fba80919d589a3.zip"],
    sha256 = "53c485a17e6da47541bac5279d5fa16e5c61fc56fc5de84cc3262f2294627885",
)

load("@rules_imagemagick//:index.bzl", "imagemagick_repositories")
imagemagick_repositories()
```

## License

MIT
