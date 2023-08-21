import '../../map/layer/map_layer.dart';

class ImageLayer extends MapLayer {
  String image;
  double parallaxX;
  double parallaxY;
  bool repeatX;
  bool repeatY;

  ImageLayer({
    required this.image,
    this.parallaxX = 1,
    this.parallaxY = 1,
    this.repeatX = false,
    this.repeatY = false,
  });

  ImageLayer.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        parallaxX = double.tryParse(json['parallaxx'].toString()) ?? 1,
        parallaxY = double.tryParse(json['parallaxy'].toString()) ?? 1,
        repeatX = json['repeatx'] ?? false,
        repeatY = json['repeaty'] ?? false {
    setParamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['parallaxx'] = this.parallaxX;
    data['parallaxy'] = this.parallaxY;
    data['image'] = this.image;
    data.addAll(super.toJson());
    return data;
  }
}
