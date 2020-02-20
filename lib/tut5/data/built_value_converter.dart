import 'package:chopper/chopper.dart';
import 'package:tuts/tut5/model/serializers.dart';
import 'package:built_collection/built_collection.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(
      request.replace(
        body: serializers.serializeWith(
          serializers.serializerForType(request.body.runtimeType),
          request.body,
        ),
      ),
    );
  }

  @override
  Response<BodyType> convertResponse<BodyType, T>(Response response) {
    final Response dynamicResponse = super.convertResponse(response);
    final BodyType customBody = _convertToCustomObject<T>(dynamicResponse.body);
    return dynamicResponse.replace<BodyType>(body: customBody);
  }

  dynamic _convertToCustomObject<T>(dynamic element) {
    if (element is T) return element;
    if (element is List) return _deserializeListOf<T>(element);
    return _deserialize<T>(element);
  }

  BuiltList<T> _deserializeListOf<T>(List dynamicList) {
    return BuiltList<T>(
      dynamicList.map(
        (element) => _deserialize<T>(element),
      ),
    );
  }

  T _deserialize<T>(Map<String, dynamic> element) {
    return serializers.deserializeWith(
      serializers.serializerForType(T),
      element,
    );
  }
}
