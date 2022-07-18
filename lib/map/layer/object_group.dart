import 'package:tiledjsonreader/map/layer/map_layer.dart';
import 'package:tiledjsonreader/map/layer/objects.dart';

class ObjectGroup extends MapLayer {
  String? drawOrder;
  List<Objects>? objects;

  ObjectGroup({
    this.drawOrder,
    this.objects,
  });

  ObjectGroup.fromJson(Map<String, dynamic> json) {
    drawOrder = json['draworder'];
    if (json['objects'] != null) {
      objects = <Objects>[];
      json['objects'].forEach((v) {
        objects?.add(new Objects.fromJson(v));
      });
    }
    setParamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['draworder'] = this.drawOrder;

    if (this.objects != null) {
      data['objects'] = this.objects?.map((v) => v.toJson()).toList();
    }
    data.addAll(super.toJson());
    return data;
  }
}
