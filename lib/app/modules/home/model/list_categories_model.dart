class ListCategoriesModel {
  int? id;
  String? nome;
  String? url;
  int? check;
  String? checkWeb;
  int? rows;

  ListCategoriesModel(
      {this.id, this.nome, this.url, this.check, this.checkWeb, this.rows});

  ListCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    url = json['url'];
    check = json['check'];
    checkWeb = json['check_web'];
    rows = json['rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['url'] = url;
    data['check'] = check;
    data['check_web'] = checkWeb;
    data['rows'] = rows;
    return data;
  }
}