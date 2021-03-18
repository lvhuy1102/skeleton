// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api-crm-dev.meey.dev/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<String> getCustomerById(customerId) async {
    ArgumentError.checkNotNull(customerId, 'customerId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'customerId': customerId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        '/api/customer/get-customer-by-id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }
}
