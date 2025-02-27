import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
    final dio = Dio();

    // Token fixe
    dio.options.headers["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjM2NGI5MWMwLTdkMmQtNDQ1My04YTNmLTIxZjA5MzM4MGQ0OCIsImlhdCI6MTc0MDY2NDUyNywic3ViIjoiZGV2ZWxvcGVyLzYzYWYyNjVhLWIzYWQtZTEzZi0yZjgxLTJkNzRmZWM1NGMyYiIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyI3Ny4xMjguMTUzLjE0OSJdLCJ0eXBlIjoiY2xpZW50In1dfQ.j9CBDtgzKQxENcdDeEtZbYSfQs7_DjUZxGq40SB_BHRAd9Hc02p95Rv6-cfWR2skoz1_Of62jtCxUQBw0CVOIg";
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";

    return dio;
});