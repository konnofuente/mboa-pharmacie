import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart'; // Génération de code pour Retrofit// Définir le provider pour ApiClientHelper à l'aide de Riverpod

// Déclaration de la classe ApiClient avec Retrofit
@RestApi()
abstract class ApiClient {
  // Factory pour créer une instance d'ApiClient
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
}
