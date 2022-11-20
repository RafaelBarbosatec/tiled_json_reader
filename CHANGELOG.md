## [1.2.6]
* Improvements in `TileSetItem`

## [1.2.5]
* Fix crash when WangColor probability is int. Thanks [Schwusch](https://github.com/Schwusch)

## [1.2.4]
* Fix `TileSetDetail`

## [1.2.3]
* adds `typeOrClass`. it's `type` if Tiled 1.8 or less, or `class` if Tiled 1.9;

## [1.2.2]
* fix `updateFromMap`;

## [1.2.1]
* fix json property `tileWidth` to `tilewidth`;

## [1.2.0]
* Improvements in read tileset.

## [1.1.2]
* Adds properties in Layers
* fix probability of TileSetItem. [PR 5](https://github.com/RafaelBarbosatec/tiled_json_reader/pull/5). Thanks [gnenux](https://github.com/gnenux)

## [1.1.1]
* Adds new property in Tile: `tileClass`.
* Fix rotation of TileSetObject. [#4](https://github.com/RafaelBarbosatec/tiled_json_reader/pull/4) Thanks [MrDgbot](https://github.com/MrDgbot)!

## [1.1.0]
* Adds support to `tsj` and `tmj` files

## [1.0.9]
* Add `polygon` and `polyline` in `Objects`.

## [1.0.8]
* Add `Text` in `Objects`.

## [1.0.7]
* Change parallax params to double.

## [1.0.6]
* Fix `gid` == null

## [1.0.5]
* Add parallax params in `ImageLayer`
* Add param `gid` in `Objects`. [issue 3](https://github.com/RafaelBarbosatec/tiled_json_reader/issues/3)

## [1.0.4] - 20/07/2021
* improvements in type `group`

## [1.0.3] - 18/06/2021
* forces parameter `version` conversion to `Double`

## [1.0.1] - 15/05/2021
* add group layer
* add image layer

## [1.0.0+1] - 01/04/2021
* update package description

## [1.0.0] - 01/04/2021
* add null-safety
* add Objects properties [PR](https://github.com/RafaelBarbosatec/tiled_json_reader/pull/2)

## [0.0.8] - 17/09/2020
* improvements toJson in `TileSetDetail`.

## [0.0.7] - 04/08/2020
* add offset in ObjectGroup.

## [0.0.6] - 04/08/2020
* improved conversion of parameters to double in TileLayer.

## [0.0.5] - 15/06/2020
* add type in TileSetItem.

## [0.0.4] - 12/06/2020
* add animation in TileSetItem.

## [0.0.3] - 10/06/2020
* Fix type param in TileSetObject.

## [0.0.2] - 08/06/2020
* Fix bug read TileSet.

## [0.0.1] - 08/06/2020
* First release
