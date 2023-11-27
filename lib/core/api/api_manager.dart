import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ApiManager {
  Dio dio = Dio();
  Options options = Options(headers: {'Authorization': Constants.token});
  Future<Response> getData(String endPoint) {
    return dio.get(Constants.basURl + endPoint, options: options);
  }

  Future<Response> postData(String endPoint, {Map<String, dynamic>? body}) {
    return dio.post(Constants.basURl + endPoint, data: body);
  }

  Future<Response> deleteData(String endPoint) {
    return dio.delete(Constants.basURl + endPoint, options: options);
  }
}
