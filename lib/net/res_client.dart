import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'res_client.g.dart';
@RestApi(baseUrl: "https://api-crm-dev.meey.dev/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/customer/get-customer-by-id")
  Future<String> getCustomerById(@Query('customerId') int customerId,);

}
