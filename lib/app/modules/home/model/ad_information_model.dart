class AdModel {
  List<AnunciosProximos>? anunciosProximos;
  List<AnunciosPais>? anunciosPais;

  AdModel({
    this.anunciosProximos,
    this.anunciosPais,
  });

  AdModel.fromJson(Map<String, dynamic> json) {
    if (json['anuncios_proximos'] != null) {
      anunciosProximos = <AnunciosProximos>[];
      anunciosProximos = List.from(json['anuncios_proximos'])
          .map((e) => AnunciosProximos.fromJson(e))
          .toList();
    }
    if (json['anuncios_pais'] != null) {
      anunciosPais = <AnunciosPais>[];
      anunciosPais = List.from(json['anuncios_pais'])
          .map((e) => AnunciosPais.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (anunciosProximos != null) {
      data['anuncios_proximos'] =
          anunciosProximos!.map((v) => v.toJson()).toList();
    }
    if (anunciosPais != null) {
      data['anuncios_pais'] = anunciosPais!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnunciosProximos {
  int? rows;

  AnunciosProximos({this.rows});

  AnunciosProximos.fromJson(Map<String, dynamic> json) {
    rows = json['rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rows'] = rows;
    return data;
  }
}

class AnunciosPais {
  int? id;
  String? nome;
  String? valor;
  String? data;
  String? avatarAnunciante;
  int? idAnunciante;
  String? nomeAnunciante;
  String? categoria;
  String? url;
  String? cidade;
  String? estado;
  int? likes;
  int? cliques;
  int? turbinado;
  String? validadeTurbinado;
  String? media;
  int? rows;

  AnunciosPais(
      {this.id,
      this.nome,
      this.valor,
      this.data,
      this.avatarAnunciante,
      this.idAnunciante,
      this.nomeAnunciante,
      this.categoria,
      this.url,
      this.cidade,
      this.estado,
      this.likes,
      this.cliques,
      this.turbinado,
      this.validadeTurbinado,
      this.media,
      this.rows});

  AnunciosPais.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    valor = json['valor'];
    data = json['data'];
    avatarAnunciante = json['avatar_anunciante'];
    idAnunciante = json['id_anunciante'];
    nomeAnunciante = json['nome_anunciante'];
    categoria = json['categoria'];
    url = json['url'];
    cidade = json['cidade'];
    estado = json['estado'];
    likes = json['likes'];
     cliques = json['cliques'];
     turbinado = json['turbinado'];
     validadeTurbinado = json['validade_turbinado'];
     media = json['media'];
     rows = json['rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['valor'] = valor;
    data['data'] = this.data;
    data['avatar_anunciante'] = avatarAnunciante;
    data['id_anunciante'] = idAnunciante;
    data['nome_anunciante'] = nomeAnunciante;
    data['categoria'] = categoria;
    data['url'] = url;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['likes'] = likes;
    data['cliques'] = cliques;
    data['turbinado'] = turbinado;
    data['validade_turbinado'] = validadeTurbinado;
    data['media'] = media;
    data['rows'] = rows;
    return data;
  }
}
