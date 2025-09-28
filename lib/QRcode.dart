import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
class getter{
    static var channel = MethodChannel("qrcode.com/channel");
  static Future<void> check(TextEditingController controller) async{
    try{
      final bool isValid = await channel.invokeMethod("QrcodeCaller") ?? false;
      if(controller.text.isNotEmpty && isValid)
      print("QR valid: isValid");
      else print("QR is not valid or Empty");
    }on PlatformException catch(e){
      print("${e.message}");
    }
  }
}