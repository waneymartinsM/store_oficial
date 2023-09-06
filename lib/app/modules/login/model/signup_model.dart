class SignUpModel {
  String? nome;
  String? email;
  String? celular;
  String? dataNascimento;
  String? documento;
  List<String>? interesses;
  String? password;
  String? latitude;
  String? longitude;
  String? token;

  SignUpModel(
      {this.nome,
      this.email,
      this.celular,
      this.dataNascimento,
      this.documento,
      this.interesses,
      this.password,
      this.latitude,
      this.longitude,
      this.token});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    celular = json['celular'];
    dataNascimento = json['data_nascimento'];
    documento = json['documento'];
    interesses = json['interesses'].cast<String>();
    password = json['password'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['email'] = email;
    data['celular'] = celular;
    data['data_nascimento'] = dataNascimento;
    data['documento'] = documento;
    data['interesses'] = interesses;
    data['password'] = password;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['token'] = token;
    return data;
  }
}
