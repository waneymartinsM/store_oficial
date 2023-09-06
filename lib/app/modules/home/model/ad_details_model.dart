class DetailsAdModel {
  int? id;
  int? idAnunciante;
  int? idCategoria;
  String? nomeAnunciante;
  String? avatarAnunciante;
  int? likedMe;
  int? cliques;
  String? save;
  String? followMe;
  String? nome;
  String? valor;
  String? valorDescontado;
  String? data;
  String? categoria;
  String? url;
  String? cidade;
  String? cep;
  String? endereco;
  String? bairro;
  String? numero;
  String? latitude;
  String? longitude;
  String? video;
  String? linkExterno;
  int? percDesconto;
  String? descricao;
  String? estado;
  int? likes;
  List<Comentarios>? comentarios;
  String? media;
  List<Fotos>? fotos;

  DetailsAdModel(
      {this.id,
        this.idAnunciante,
        this.idCategoria,
        this.nomeAnunciante,
        this.avatarAnunciante,
        this.likedMe,
        this.cliques,
        this.save,
        this.followMe,
        this.nome,
        this.valor,
        this.valorDescontado,
        this.data,
        this.categoria,
        this.url,
        this.cidade,
        this.cep,
        this.endereco,
        this.bairro,
        this.numero,
        this.latitude,
        this.longitude,
        this.video,
        this.linkExterno,
        this.percDesconto,
        this.descricao,
        this.estado,
        this.likes,
        this.comentarios,
        this.media,
        this.fotos});

  DetailsAdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idAnunciante = json['id_anunciante'];
    idCategoria = json['id_categoria'];
    nomeAnunciante = json['nome_anunciante'];
    avatarAnunciante = json['avatar_anunciante'];
    likedMe = json['liked_me'];
    cliques = json['cliques'];
    save = json['save'];
    followMe = json['follow_me'];
    nome = json['nome'];
    valor = json['valor'];
    valorDescontado = json['valor_descontado'];
    data = json['data'];
    categoria = json['categoria'];
    url = json['url'];
    cidade = json['cidade'];
    cep = json['cep'];
    endereco = json['endereco'];
    bairro = json['bairro'];
    numero = json['numero'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    video = json['video'];
    linkExterno = json['link_externo'];
    percDesconto = json['perc_desconto'];
    descricao = json['descricao'];
    estado = json['estado'];
    likes = json['likes'];
    if (json['comentarios'] != null) {
      comentarios = <Comentarios>[];
      json['comentarios'].forEach((v) {
        comentarios!.add(new Comentarios.fromJson(v));
      });
    }
    media = json['media'];
    if (json['fotos'] != null) {
      fotos = <Fotos>[];
      json['fotos'].forEach((v) {
        fotos!.add(new Fotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_anunciante'] = idAnunciante;
    data['id_categoria'] = idCategoria;
    data['nome_anunciante'] = nomeAnunciante;
    data['avatar_anunciante'] = avatarAnunciante;
    data['liked_me'] = likedMe;
    data['cliques'] = cliques;
    data['save'] = save;
    data['follow_me'] = followMe;
    data['nome'] = nome;
    data['valor'] = valor;
    data['valor_descontado'] = valorDescontado;
    data['data'] = this.data;
    data['categoria'] = categoria;
    data['url'] = url;
    data['cidade'] = cidade;
    data['cep'] = cep;
    data['endereco'] = endereco;
    data['bairro'] = bairro;
    data['numero'] = numero;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['video'] = video;
    data['link_externo'] = linkExterno;
    data['perc_desconto'] = percDesconto;
    data['descricao'] = descricao;
    data['estado'] = estado;
    data['likes'] = likes;
    if (comentarios != null) {
      data['comentarios'] = comentarios!.map((v) => v.toJson()).toList();
    }
    data['media'] = media;
    if (fotos != null) {
      data['fotos'] = fotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comentarios {
  int? rows;

  Comentarios({this.rows});

  Comentarios.fromJson(Map<String, dynamic> json) {
    rows = json['rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rows'] = rows;
    return data;
  }
}

class Fotos {
  String? url;
  int? id;

  Fotos({this.url, this.id});

  Fotos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}