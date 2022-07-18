import '../../map/layer/map_layer.dart';

class TileLayer extends MapLayer {
  List<int>? data;
  double? height;
  double? width;

  TileLayer({
    this.data,
    this.height,
    this.width,
  });

  TileLayer.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<int>();
    height = double.tryParse(json['height'].toString()) ?? 0.0;
    width = double.tryParse(json['width'].toString()) ?? 0.0;

    setParamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['height'] = this.height;
    data['width'] = this.width;
    data.addAll(super.toJson());
    return data;
  }
}
