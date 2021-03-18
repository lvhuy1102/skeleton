

import 'package:skeleton_flutter/net/dioHelper.dart';
import 'package:skeleton_flutter/net/res_client.dart';

class Repository {
  RestClient apiClient;
  Repository() {
    apiClient = RestClient(DioHelper.dioObject, baseUrl: "https://api-crm-dev.meey.dev/");
  }
}
