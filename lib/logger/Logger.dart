import 'package:logger/logger.dart';

class Log {

  static printDebug(String message){
    Logger().d(message);
  }

  static printError(String message){
    Logger().e(message);
  }

  Log._();
}
