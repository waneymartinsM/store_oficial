import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:store_oficial/app/modules/home/model/ad_information_model.dart';
import 'package:store_oficial/app/modules/home/model/list_ads_model.dart';

Future<AdModel> fetchAnuncio(ListAdsModel listAdsModel) async {
  const url = 'https://webe.com.br/hm/webservice/usuario/anuncios/listall';
  const headers = {'Content-Type': 'application/json'};

  try {
    final response = await Dio().post(
      url,
      data: listAdsModel.toJson(),
      options: Options(headers: headers),
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${jsonDecode(response.data)}');

    if (response.statusCode == 200) {
      final data = List.from(jsonDecode(response.data)).first;
      return AdModel.fromJson(data);
    } else {
      throw Exception('Falha ao carregar anúncio');
    }
  } catch (e) {
    throw Exception('Falha ao carregar anúncio: $e');
  }
}



