import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:tuts/tut5/data/built_value_converter.dart';
import 'package:tuts/tut5/model/built_post.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<BuiltPost>> getPost(@Path('id') int id);

  @Post()
  Future<Response<BuiltPost>> postPost(@Body() BuiltPost body);

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        // HeadersInterceptor({'Cache-Control': 'no-cache'}),
        // HttpLoggingInterceptor(),
        CurlInterceptor(),
        // (Request request) {
        //   if (request.method == HttpMethod.Get) {
        //     chopperLogger.info('Perform GET Http Request');
        //   }
        //   return request;
        // },
        // (Response response) {
        //   if (response.statusCode == HttpStatus.ok) {
        //     chopperLogger.info('Status code ${response.statusCode}');
        //   }
        //   return response;
        // },
        // MobileDataCostException(),
      ],
    );
    return _$PostApiService(client);
  }
}
