import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'loginModel.dart';

class ApiService {
  Future<Either<Failure, String>> login(
      {required String email, required String password}) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginApi);
      var response =
          await http.post(url, body: ({"email": email, "password": password}));

      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Right(responseData["token"]);
      }
    } catch (e) {
      log(e.toString());
    }
    return const Left(Failure(message: "Failed to login"));
  }

  Future<Either<Failure, List<Object>>> register(
      {required String email, required String password}) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerApi);
      var response =
          await http.post(url, body: ({"email": email, "password": password}));

      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Right([
          responseData["id"],
          responseData["token"],
        ]);
      }
    } catch (e) {
      log(e.toString());
    }
    return const Left(Failure(message: "Failed to register"));
  }
}
