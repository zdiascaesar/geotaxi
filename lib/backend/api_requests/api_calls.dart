import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'cloud_call_http.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GeocodingAPICall {
  static Future<ApiCallResponse> call({
    String? searchText = '',
    String? accessToken =
        'sk.eyJ1IjoiNmVremhhbiIsImEiOiJjbHppOWgyM3MwYnEyMmxxeDYwZDdydWFrIn0.CHel7EOfmqeQmA2PSKefDg',
  }) async {
    return await makeCloudCallHttp(
      Firebase.app().options.projectId,
      _kPrivateApiFunctionName,
      {
        'callName': 'GeocodingAPICall',
        'variables': {
          'searchText': searchText,
          'accessToken': accessToken,
        },
      },
    );
  }
}

class DaDataCall {
  static Future<ApiCallResponse> call({
    String? address = '',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "$address",
  "count": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DaData',
      apiUrl:
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Token 1a690c10f772a957edd2aaeb749ae9f52c3470a9',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? lat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.suggestions[:].data.geo_lat''',
      ));
  static String? lon(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.suggestions[:].data.geo_lon''',
      ));
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.suggestions[:].value''',
      ));
  static String? street(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.suggestions[:].data.street''',
      ));
  static String? building(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.suggestions[:].data.house''',
      ));
}

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? code = '',
  }) async {
    final ffApiRequestBody = '''
{
  "code": "$code"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmail',
      apiUrl: 'https://hook.us1.make.com/8d8tot4aemfw4jyhpujenl2u56wb7218',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GoogleAPICall {
  static Future<ApiCallResponse> call({
    String? address = '',
    String? aPIKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google API',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$address&key=$aPIKey',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address,
        'API-Key': aPIKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? addresses(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? latLngs(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
        true,
      ) as List?;
}

class PlacesGoogleAPICall {
  static Future<ApiCallResponse> call({
    String? input = '',
    String? key = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Places Google API',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$key',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': input,
        'key': key,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
