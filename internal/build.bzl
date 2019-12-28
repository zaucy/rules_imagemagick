def magick_genrule(
    cmd = None,
    cmd_bash = None,
    cmd_bat = None,
    cmd_ps = None,
    exec_tools = [],
    magick_bin = "@imagemagick//:magick",
    **kwargs):
    """Convenient genrule wrapper for ImageMagicks 'magick' executable

    Args:
        cmd: Passed to native.genrule with magick_bin prepended to it
        cmd_bash: Passed to native.genrule with magick_bin prepended to it
        cmd_bash: Passed to native.genrule with magick_bin prepended to it
        cmd_bat: Passed to native.genrule with magick_bin prepended to it
        cmd_ps: Passed to native.genrule with magick_bin prepended to it
        exec_tools: Passed to native.genrule with magick_bin appended to it
        magick_bin: Image Magick 'magick' binary executable
        **kwargs: Rest of the arguments passed directly to native.genrule
    """
    magick_bin_location_str = "$(location " + magick_bin + ") "
    exec_tools = exec_tools + [magick_bin]

    if cmd != None:
        cmd = magick_bin_location_str + cmd

    if cmd_bash != None:
        cmd_bash = magick_bin_location_str + cmd

    if cmd_bat != None:
        cmd_bat = magick_bin_location_str + cmd

    if cmd_ps != None:
        cmd_ps = magick_bin_location_str + cmd

    native.genrule(
        cmd = cmd,
        cmd_bash = cmd_bash,
        cmd_bat = cmd_bat,
        cmd_ps = cmd_ps,
        exec_tools = exec_tools,
        **kwargs
    )
