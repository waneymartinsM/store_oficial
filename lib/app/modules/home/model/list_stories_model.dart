class ListStoriesModel {
  int? id;
  String? nome;
  String? video;
  String? url;
  int? rows;

  ListStoriesModel({this.id, this.nome, this.video, this.url, this.rows});

  ListStoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    video = json['video'];
    url = json['url'];
    rows = json['rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['video'] = video;
    data['url'] = url;
    data['rows'] = rows;
    return data;
  }
}