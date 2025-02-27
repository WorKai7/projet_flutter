import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dio_provider.dart';

final apiHelperProvider = Provider<ApiHelper>((ref) {
    var dio = ref.watch(dioProvider);
    return ApiHelper(dio: dio);
});

class ApiHelper {
    final Dio dio;

    ApiHelper({required this.dio});

    Future<Map<String, dynamic>?> getRandomCard() async {
        const url = "https://api.clashroyale.com/v1/cards";
        try {
            // Appel API
            final response = await dio.get(url);

            // Récupération d'une carte aléatoire
            final random = Random();
            final nb = random.nextInt(119);
            final randomCard = response.data["items"][nb];
            return randomCard;
        } catch (e) {
            print(e);
            return null;
        }
    }

    Future<List<dynamic>?> getCards() async {
        const url = "https://api.clashroyale.com/v1/cards";
        try {
            // Appel API
            final response = await dio.get(url);
            return response.data["items"];
        } catch (e) {
            print(e);
            return null;
        }
    }
  
}