import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';

Future<Uint8List?> sendImageToServer(
    Uint8List pngBytes, CancelToken can) async {
  try {
    Dio dio = Dio();
    String myURI = "$hostPort$addFile1";

    final response = await dio.post(
      cancelToken: can,
      myURI,
      data: jsonEncode({
        "image": base64Encode(pngBytes),
      }),
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
        responseType: ResponseType.bytes,
      ),
    );

    if (response.statusCode == 200) {
      return response.data as Uint8List;
    } else {
      ErrorHandler.handleDioError(DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      ));
      return null;
    }
  } catch (e) {
    if (e is DioException) {
      ErrorHandler.handleDioError(e);
    } else {
      ErrorHandler.handleException(Exception(e.toString()));
    }
    return null;
  }
}
