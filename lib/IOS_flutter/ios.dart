import 'package:flutter/material.dart';
import 'package:_halwidget_/android_flutter/DropDownList.dart';
import 'package:_halwidget_/IOS_flutter/QRPayment_IOS.dart';
import 'package:_halwidget_/android_flutter/additionalInfo.dart';
import 'package:_halwidget_/IOS_flutter/appBar_ios.dart';
import 'additionalInfo_ios.dart';
import 'package:flutter/cupertino.dart';
import 'CuppertinoPageScaffold.dart';
class IOS_settings extends StatefulWidget {
  const IOS_settings({super.key});

  @override
  State<IOS_settings> createState() => _IOS_settingsState();
}

class _IOS_settingsState extends State<IOS_settings> {
  bool allowScreenshots = true;
  bool webViewDebugmode = true;
  String token = "";
  String SelectedProcess = "Main view";
  final ProcessList processes = new ProcessList();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Color(0xFFF2F2F7),
      appBar: CustomAppBar_IOS(),
      body:Column(
        children: [
          Expanded(child: CupertinoNeoTab()),
        ],
      ),        
      );
  }
}