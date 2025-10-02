import 'package:_halwidget_/android_flutter/PartnerPayBridge.dart';
import 'package:flutter/material.dart';
import 'package:_halwidget_/QRcode.dart';
import 'appBar.dart';
import 'DropDownList.dart';
import 'additionalInfo.dart';
import 'package:flutter/services.dart';

class Android extends StatefulWidget {
  const Android({super.key});

  @override
  State<Android> createState() => _AndroidState();
}

class _AndroidState extends State<Android> {
  String selectedLanguage = "Рус";
  String enviroment = "Тест";
  //TextField
  TextEditingController tokenController = new TextEditingController();
  //bool for CheckBox
  bool? isScreenShots = false;
  bool? isWebView = false;
  //List for process DropdownButtons
  final ProcessList process = ProcessList();
  void initState(){
    super.initState();
    tokenController.addListener(() {
      setState(() {});
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: CustomAppBar(),
    body: SingleChildScrollView(

      child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckPay()));
            }, child: Text("Press")),
              Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F7),
              ),
              child: Padding( 
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Настройки")
                  ),
              ),
            ),
            //Настройка выбор
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Язык",
                            border: OutlineInputBorder()
                          ),
                          items: <String>["Рус", "Англ", "Каз"].map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(), 
                        value: selectedLanguage,
                        onChanged: (String? newValue) =>{
                          setState((){
                            selectedLanguage = newValue!;
                          })
                        }),
                      ), 
                    ),
                    SizedBox(width: 5),
                    //второй форма
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: "Окружение",
                              border: OutlineInputBorder()
                            ),
                            items: <String>["Тест", "Англ", "Каз"].map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(), 
                          value: enviroment,
                          onChanged: (String? newValue) =>{
                            setState((){
                              enviroment = newValue!;
                            })
                          }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //Token
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: tokenController,
                      decoration: InputDecoration(
                        labelText: "Insert partner token",
                        border: OutlineInputBorder(),
                      )
                    ),
                  ),
                  SizedBox(width: 20,),
                  tokenController.text == '' ? Icon(Icons.lock, size: 20, color: Colors.red,) : Icon(Icons.lock_open_outlined, size: 20, color: Colors. green,)  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Разрешить скриншоты'),
                SizedBox(width: 70),
                Checkbox(
                
                value: isScreenShots,   
                onChanged: (bool? NewValue){
                  setState((){
                  isScreenShots = NewValue;
                  });
              }
              )
                ],
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Webview debug mode'),
                SizedBox(width: 70),
                Checkbox(
                value: isWebView,   
                onChanged: (bool? newValue){
                  setState((){
                  isWebView = newValue;
                  });
              }
                      )
                    ],
                  ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F7),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft   ,
                  child: Text('Выберите процесс')
                  ),
                ),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Процесс',
              ),
              value: process.selectedValue,
              items: process.dropdownItems,
      
              onChanged: (String? newItem){
                setState((){
                process.selectedValue = newItem!;
                }
                );
              }
              ),
          ),
          if (process.selectedValue != 'Main view') Additionalinfo(),
          if (process.selectedValue == 'QR платеж') QRcodeFields(), 
          if(process.selectedValue == "Onboarding") Onboarding(),
          if(process.selectedValue == "Card select for refill") Refill(),
          Padding(
            padding: EdgeInsets.fromLTRB  (16,32,16,16),
            child: ElevatedButton(
            onPressed:  ()    {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.widthOf(context) * 0.95, 55),
                backgroundColor: Color(0xFF2AA65C),
                foregroundColor: Colors.white,
              ),
              child: Text('Начать')
              ),
          ),
      ],//Column
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rounded),
              label: "Label",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rounded),
              label: "Label",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rounded),
              label: "Label",
            )
           
          ]),
);
  }
}
//ONBOARDING
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  TextEditingController coorelationId = TextEditingController();
  //input to controller (if != onBoardingId && ... )
  static const platform = MethodChannel("partner_sdk");
  Future<void> check() async{
    try{
      var result = platform.invokeMethod("checkPartner");
      print(result);
    }catch(e){
      print(e);
    }
  }
  void initState(){
    super.initState();
    check();
  } 
  String _status = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                      controller: coorelationId,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ID',
                        hintText: 'Insert Corelation ID',
                      ),
                    ),
              ),
                  ElevatedButton(onPressed: (){}, child: Text("Press")),
                  SizedBox(width: 20),
                  Text(_status),
            ],
          ),
        ),
      ],
    );
  }
}
//QR-CODE
class QRcodeFields extends StatefulWidget {
  const QRcodeFields({super.key});
  
  @override
  State<QRcodeFields> createState() => _QRcodeFieldsState();
}

class _QRcodeFieldsState extends State<QRcodeFields> {
  
  TextEditingController QRcodeId = new TextEditingController();
  TextEditingController coorelationId = new TextEditingController();
  String _result = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Column(
        children: [
          TextField(
            controller: coorelationId,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ID',
              hintText: 'Insert Corelation ID',
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: QRcodeId,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'QR',
              hintText: 'In sert QR code sring',
            ),
          ),
          ElevatedButton(
            onPressed: () => getter.check(QRcodeId), 
          child: Text('Press QR check')
          ),
        ],
      ),
    );
  }
}
//REFILL
class Refill extends StatefulWidget {
  const Refill({super.key});

  @override
  State<Refill> createState() => _RefillState();
}

class _RefillState extends State<Refill> {
  TextEditingController refill = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: Expanded(
        child: TextField(
              controller: refill,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ID',
                hintText: 'Insert Corelation ID',
              ),
            ),
      ),
      );
  }
}