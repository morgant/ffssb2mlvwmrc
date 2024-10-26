# ffssb2mlvwmrc
by Morgan Aldridge <morgant@makkintosshu.com>

## OVERVIEW

This is a small utility to generate [MLVWM](https://github.com/morgant/mlvwm) application styles (specifically [`mlvwmrc`](https://github.com/morgant/mlvwmrc)) for [Firefox](https://www.mozilla.org/firefox/) SSBs (Site-Specific Browsers) which have been created using [Sebastian Appler's `ffssb`](https://github.com/sebastianappler/ffssb).

**Important:** _This utility is in early testing. Please back up your data, especially your `~/.mlvwm/` configs, before using this!_

`ffssb2mlvwmrc` generates an `~/.mlvwm/apps/ffssb/` directory containing:

* One application styles file per FFSSB, especially:
    * The FFSSB's name
    * The FFSSB's icon or the Firefox icon
    * The Firefox menus and other styles
* An `.AppsManifest` which includes a `Read` command for each of the aforementioned FFSSB-specific files
* An `.AppsMenu` which contains a `Menu...END` configuration block with menu items for all of the FFSSBs

It will also:

1. Confirm that the generated `~/mlvwm/apps/ffssb/.AppsManifest` file is included in your main `~/mlvwm/apps/.AppsManifest` file
2. Output basic instructions for including the generated `~/.mlvwm/apps/ffssb/.AppsMenu` and adding a `SubMenu ...` configuration line to one of your `Menu...END` blocks

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

You must have created at least one FFSSB using `ffssb`. You can confirm this by listing your FFSSBs:

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

### Regenerating Application Styles

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

### Adding a Submenu to a Menu

After generating/regenerating FFSSBs application styles by executing `ffssb2mlvwmrc` (see above), you can also insert a submenu into the menu of your choice, listing all your FFSSBs, for quick launch. For example, you might add it to your `theme/*` files as follows:

1. Back up your existing `~/.mlvwm/themes/` directory:
    ```
    cp -R ~/.mlvwm/themes{,.$(date +%Y%m%d-%H%M%S)}
    ```
2. Edit one of the `~/.mlvwm/themes/*` files (for example, `System7`)
3. Above the line containing `Menu Apple, ...`, add the following line:
    ```
    Read .mlvwm/apps/ffssb/.AppsMenu
    ```
4. After the line containing `Menu Apple, ...` and before the nearest line containing `END`, add the following line:
    ```
    "FFSSBs" SubMenu FFSSB-FFSSBs, Icon folder.xpm
    ```
5. Save your changes
6. Restart `mlvwm` to reload your configurations & application styles

## LICENSE

Released under the [MIT License](LICENSE).
