import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/post_models.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/character')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('character')
  Future<RickMorty> getAllPosts();
}
