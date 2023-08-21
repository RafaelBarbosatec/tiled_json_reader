import 'package:tiledjsonreader/map/layer/map_layer.dart';
import 'package:tiledjsonreader/map/layer/objects.dart';

class ObjectLayer extends MapLayer {
  String? drawOrder;
  List<Objects>? objects;

  ObjectLayer({
    this.drawOrder,
    this.objects,
  });

  ObjectLayer.fromJson(Map<String, dynamic> json) {
    drawOrder = json['draworder'];
    if (json['objects'] != null) {
      objects = <Objects>[];
      json['objects'].forEach((v) {
        objects?.add(Objects.fromJson(v));
      });
    }
    setParamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['draworder'] = this.drawOrder;

    if (this.objects != null) {
      data['objects'] = this.objects?.map((v) => v.toJson()).toList();
    }
    data.addAll(super.toJson());
    return data;
  }
}
