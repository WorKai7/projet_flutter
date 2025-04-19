import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
    final dio = Dio();

    // Token fixe
    dio.options.headers["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImQzYWFjZjZmLTQzN2MtNDFkMi1iMmU5LWYzOTBjYWU2MWE5MyIsImlhdCI6MTc0NTA2MDc5OSwic3ViIjoiZGV2ZWxvcGVyLzYzYWYyNjVhLWIzYWQtZTEzZi0yZjgxLTJkNzRmZWM1NGMyYiIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyI4MS40OS44OC4xNzUiXSwidHlwZSI6ImNsaWVudCJ9XX0.NQLdgMKF9j2xqJj4N-mNoXEqdKpHv96KLCDEQX_YYJ3APJJrY4R9FV_jPsF6g0Ttw0tzTjsFT4F36uCtlDkawA";
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";

    return dio;
});