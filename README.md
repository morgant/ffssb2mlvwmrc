# ffssb2mlvwmrc
by Morgan Aldridge <morgant@makkintosshu.com>

## OVERVIEW

This is a small utility to generate [MLVWM](https://github.com/morgant/mlvwm) application styles (specifically [`mlvwmrc`](https://github.com/morgant/mlvwmrc)) for [Firefox](https://www.mozilla.org/firefox/) SSBs (Site-Specific Browsers) which have been created using [Sebastian Appler's `ffssb`](https://github.com/sebastianappler/ffssb).

**Important:** _This utility is in early testing. Please back up your data, especially your `~/.mlvwm/` configs, before using this!_

## PREREQUISITES

* [MLVWM](https://github.com/morgant/mlvwm)
* [`mlvwmrc`](https://github.com/morgant/mlvwmrc)
* [`ffssb`](https://github.com/sebastianappler/ffssb)
* [ImageMagick](https://imagemagick.org/)

## INSTALLATION

```
make install
```

## USAGE

You must have created at least on FFSSB using `ffssb`. You can confirm this by listing your FFSSBs:

```
ffssb list
```

### First Run

If you've never used `ffssb2mlvwmrc` before and don't have any `~/.mlvwm/apps/ffsb/` or `~/.mlvwm/pixmap/ffssb/` directories, you can:

1. Execute `ffssb2mlvwmrc` to create FFSSB application styles, icons, and a manifest file:
    ```
    ffssb2mlvwmrc
    ```
2. Add your newly created FFSSB applications manifest to your main `mlvwmrc` applications manifest file. You can do this by editing `~/.mlvwm/apps/.AppsManifest` and adding the following line:
    ```
    Read .mlvwm/apps/ffssb/.AppsManifest
    ```
3. Restart `mlvwm` to reload your configurations & application styles

### Regenerating FFSSB Application Styles

If you've previously used `ffssb2mlvwmrc` to create FFSSB application styles et al, but you've since updated your FFSSBs, I suggest updating them as follows:

1. Move your existing `~/.mlvwm/apps/ffssb/` directory aside:
    ```
    mv ~/.mlvwm/apps/ffssb{,.$(date +%Y%m%d-%H%M%S)}
    ```
2. Execute `ffssb2mlvwmrc` to create new applications, styles, icons, and manifest file in `~/.mlvwm/apps/ffssb/`:
    ```
    ffssb2mlvwmrc
    ```
3. Restart `mlvwm` to reload your configurations & application styles

## LICENSE

Released under the [MIT License](LICENSE).
