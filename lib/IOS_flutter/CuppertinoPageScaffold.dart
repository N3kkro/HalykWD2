import 'package:_halwidget_/IOS_flutter/CardForRefill.dart';
import 'package:_halwidget_/IOS_flutter/Onboarding.dart';
import 'package:_halwidget_/IOS_flutter/QRPayment_IOS.dart';
import 'package:_halwidget_/android_flutter/DropDownList.dart';
import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";

class CupertinoNeoTab extends StatefulWidget {
  const CupertinoNeoTab({super.key});

  @override
  State<CupertinoNeoTab> createState() => _CupertinoNeoTabState();
}

class _CupertinoNeoTabState extends State<CupertinoNeoTab> {
  String SelectedLang = "RU";
  String SelectedProcess = "QR Платеж";
  final ProcessList processes = new ProcessList();
  //Notification toggle
  bool isNotificationEnabled = false;
  //Webview debug mode toggle
  bool isWebViewEnabled = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFF2F2F7),
      child: ListView(
        children: [
          CupertinoListSection(
            header: Text("НАСТРОЙКИ"
            ),
            children: [
              CupertinoListTile(
                title: Text("Язык"),
                additionalInfo: Text("$SelectedLang"),
                trailing: CupertinoListTileChevron(),
                onTap: () {
                  showCupertinoModalPopup(
                    context: context, 
                    builder: (BuildContext build){
                      return CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: (){
                              setState(() {
                                SelectedLang = "RU";
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Русский",
                            style: TextStyle(
                              color: CupertinoColors.activeBlue
                            ),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: (){
                              setState(() {
                                SelectedLang = "KZ";
                              });
                              Navigator.pop(context);
                            }, 
                            child: Text("Қазақ тілі",
                            style: TextStyle(
                              color: CupertinoColors.activeBlue
                            ),)
                            ),
                          CupertinoActionSheetAction(
                            onPressed: (){
                              setState(() {
                                SelectedLang = "EN";
                              });
                              Navigator.pop(context);
                            },
                            child: Text("English",
                            style: TextStyle(
                              color: CupertinoColors.activeBlue
                            ),
                            ),
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Cancel",
                          style: TextStyle(
                              color: CupertinoColors.activeBlue
                            ),
                          ),
                        ),
                      );
                    }
                    );
                },
              ),
              CupertinoListTile(
                title: Text("Окружение"),
                additionalInfo: Text("TEST"),
                trailing: CupertinoListTileChevron(),
                onTap: () {}, 
              ),
              CupertinoListTile(
                title: Text("Разрешить скриншоты"), 
                trailing: CupertinoSwitch(
                value: isNotificationEnabled, 
                onChanged: (bool val){
                  setState(() {
                   isNotificationEnabled = val; 
                  });
                }),  
              ),
              CupertinoListTile(
                title: Text("Webview debug mode"), 
                trailing: CupertinoSwitch(
                value: isWebViewEnabled, 
                onChanged: (bool val){
                  setState(() {
                   isWebViewEnabled = val; 
                  });
                }),  
              ),
              Row(
               children: [
                 Expanded(
                   child: CupertinoTextFormFieldRow(
                     prefix: Text("Token"),
                     obscureText: true,
                     placeholder: "Insert partner token",
                   
                   ),
                 
                 ),
                 Padding(
                 padding: EdgeInsets.only(right: 16),
                 child: Icon(
                   CupertinoIcons.lock,
                   color: CupertinoColors.systemBlue
                   ),
                 )
               ],
              )
            ],
          ),
          CupertinoListSection(
            header: Text("ВЫБЕРИТЕ ПРОЦЕСС",
            ),
            children: [
              CupertinoListTile(
                title: Text("$SelectedProcess"),
                trailing: Icon(CupertinoIcons.chevron_down,
                color: CupertinoColors.activeBlue,
                size: 18,
                fontWeight: FontWeight.bold,
                ),
                onTap: (){
                  showCupertinoModalPopup(
                    context: context, 
                    builder: (BuildContext context){
                      return CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: (){
                              setState(() {
                                SelectedProcess = "Main view";
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Main view",
                            style: TextStyle(
                              color: CupertinoColors.activeBlue
                            ),),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: (){
                              setState(() {
                                SelectedProcess = "QR Платеж";
                              });
                              Navigator.pop(context);
                            },
                            child: Text("QR Платеж",
                            style: TextStyle(
                              color: CupertinoColors.activeBlue
                            ),),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: (){
                              setState(() {
                                SelectedProcess = "Onboarding";
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Onboarding",
                            style: TextStyle(
                              color: CupertinoColors.activeBlue
                            ),),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: (){
                              setState(() {
                                SelectedProcess = "Card select for refill";
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Card select for refill",
                            style: TextStyle(
                              color: CupertinoColors.activeBlue
                            ),
                            ),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Cancel", 
                          style: TextStyle(
                            color: CupertinoColors.activeBlue,
                          ),
                          ),
                        ),
                      );
                    }
                    );
                },
              ),
            ],
            
          ),
          if(SelectedProcess == "QR Платеж") QRPayment_IOS(),
          if(SelectedProcess == "Onboarding") Onboarding_IOS(),
          if(SelectedProcess == "Card select for refill") CardSelectForRefill(),
        ],
        
      ),
    );
    
    }
}