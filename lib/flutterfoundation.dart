import 'dart:async';

import 'package:flutter/services.dart';

class Flutterfoundation {
  static const MethodChannel _channel =
      const MethodChannel('flutterfoundation');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Map <String,dynamic>> encodingJsonNetworkDataWithFunction(
      String function,
      String systemRequesId,
      String networkRequestAPiKey,
      String systemNetworkAesKey,
      String userId,
      Map inputData,
      Map expand
      ) async {
      Map map = Map();
      map["function"] = function;
      map["systemRequesId"] = systemRequesId;
      map["networkRequestAPiKey"] = networkRequestAPiKey;
      map["systemNetworkAesKey"] = systemNetworkAesKey;
      map["userId"] = userId;
      map["inputData"] = inputData;
      if (expand != null)  map["expand"] = expand;
      Map result =  await _channel.invokeMethod('httpRequestEncrypt',map);
      Map <String,dynamic> tresult = Map<String,dynamic>();
      result.forEach((key, value) {
        String tkey = key as String;
        tresult[tkey] = value;
      });
      return tresult;
  }
}
