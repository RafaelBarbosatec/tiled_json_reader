import 'dart:convert';
import 'dart:io';

import '../../map/layer/map_layer.dart';

class TileLayer extends MapLayer {
  static const GIT_ROTATE_180 = 3221225472;
  static const GIT_ROTATE_90 = 2684354560;
  static const GIT_ROTATE_270 = 1610612736;
  static const GIT_FLIP_HORIZONTAL = 2147483648;
  static const GIT_FLIP_VERTICAL = 1073741824;
  static const GIT_FLIP_HORIZONTAL_270 = 536870912;
  static const GIT_FLIP_HORIZONTAL_90 = 3758096384;

  List<int>? data;
  double? height;
  double? width;
  String? encoding;
  String? compression;

  TileLayer({
    this.data,
    this.height,
    this.width,
  });

  TileLayer.fromJson(Map<String, dynamic> json) {
    height = double.tryParse(json['height'].toString()) ?? 0.0;
    width = double.tryParse(json['width'].toString()) ?? 0.0;
    encoding = json['encoding'];
    compression = json['compression'];

    if (encoding == 'base64') {
      final base64Raw = base64Decode(json['data']);
      switch (compression) {
        case 'zlib':
          data = zlib.decode(base64Raw);
          break;
        case 'gzip':
          data = gzip.decode(base64Raw);
          break;
        default:
          data = [];
          int index = 0;
          base64Raw.forEach((element) {
            if (index % 4 == 0) {
              data?.add(element);
            }
            index++;
          });
      }
    } else {
      data = json['data'].cast<int>();
    }

    setParamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data;
    data['height'] = this.height;
    data['width'] = this.width;
    data.addAll(super.toJson());
    return data;
  }

  static GidInfo getGidInfo(int gid) {
    int index = 0;
    double angle = 0;
    bool isFlipX = false;
    bool isFlipY = false;
    if (gid > GIT_FLIP_HORIZONTAL_90) {
      isFlipX = true;
      angle = 1.5708;
      index = gid - GIT_FLIP_HORIZONTAL_90;
    } else if (gid > GIT_ROTATE_180) {
      angle = 3.14159;
      index = gid - GIT_ROTATE_180;
    } else if (gid > GIT_ROTATE_90) {
      angle = 1.5708;
      index = gid - GIT_ROTATE_90;
    } else if (gid > GIT_FLIP_HORIZONTAL) {
      isFlipX = true;
      index = gid - GIT_FLIP_HORIZONTAL;
    } else if (gid > GIT_ROTATE_270) {
      angle = 4.71239;
      index = gid - GIT_ROTATE_270;
    } else if (gid > GIT_FLIP_VERTICAL) {
      isFlipY = true;
      index = gid - GIT_FLIP_VERTICAL;
    } else if (gid > GIT_FLIP_HORIZONTAL_270) {
      isFlipX = true;
      angle = 4.71239;
      index = gid - GIT_FLIP_HORIZONTAL_270;
    } else {
      index = gid;
    }
    return GidInfo(
      index: index,
      angle: angle,
      isFlipX: isFlipX,
      isFlipY: isFlipY,
    );
  }
}

class GidInfo {
  final int index;
  final double angle;
  final bool isFlipX;
  final bool isFlipY;

  GidInfo(
      {required this.index,
      required this.angle,
      required this.isFlipX,
      required this.isFlipY});
}
