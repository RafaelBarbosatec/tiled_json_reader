import 'dart:convert';
import 'dart:io';

import '../../map/layer/map_layer.dart';

class TileLayer extends MapLayer {
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
          data = base64Raw.map((e) {
            return base64Raw[1] << 16 | base64Raw[0];
          }).toList();
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
}
