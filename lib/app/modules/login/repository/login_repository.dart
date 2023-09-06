import 'package:http/http.dart' as http;
import 'package:store_oficial/app/modules/login/model/recover_pass_model.dart';
import 'package:store_oficial/app/modules/login/model/signin_model.dart';
import 'dart:convert';

import 'package:store_oficial/app/modules/login/model/signup_model.dart';

Future<Map<String, dynamic>> signUp(SignUpModel signUpModel) async {
  const url = '';
  try {
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signUpModel.toJson()));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse is List && jsonResponse.isNotEmpty) {
        final status = jsonResponse[0]['status'];
        final message = jsonResponse[0]['msg'];
        return {'status': status, 'message': message};
      }
    } else {
      print('Erro durante a solicitação: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro durante a solicitação: $e');
  }
  return {'status': '', 'message': 'Erro durante a solicitação'};
}

Future<Map<String, dynamic>> signIn(SignInModel signInModel) async {
  const url = '';
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(signInModel.toJson()),
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse is List && jsonResponse.isNotEmpty) {
        final status = jsonResponse[0]['status'];
        final message = jsonResponse[0]['msg'];

        return {'status': status, 'message': message};
      }
    } else {
      print('Erro durante a solicitação: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro durante a solicitação: $e');
  }
  return {'status': '', 'message': 'Erro durante a solicitação'};
}

Future<Map<String, dynamic>> recoverPassword(
    RecoverPassModel recoverPassModel) async {
  const url = '';
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(recoverPassModel.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse is List && jsonResponse.isNotEmpty) {
        final status = jsonResponse.first['status'];
        final message = jsonResponse.first['msg'];

        return {'status': status, 'msg': message};
      }
    } else {
      print('Erro durante a solicitação: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro durante a solicitação: $e');
  }
  return {'status': '', 'message': 'Erro durante a solicitação'};
}
