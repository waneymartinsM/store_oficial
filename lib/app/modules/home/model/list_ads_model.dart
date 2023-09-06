class ListAdsModel {
  int? idUsuario;
  String? latitude;
  String? longitude;
  String? token;

  ListAdsModel({this.idUsuario, this.latitude, this.longitude, this.token});

  ListAdsModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['id_usuario'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_usuario'] = idUsuario;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['token'] = token;
    return data;
  }
}