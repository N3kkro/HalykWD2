import "package:flutter/material.dart";
import "package:flutter/services.dart";

class CheckPay extends StatefulWidget {
  const CheckPay({super.key});

  @override
  State<CheckPay> createState() => _CheckPayState();
}

class _CheckPayState extends State<CheckPay> {
  String? status = "";
  static var _eventChannel = EventChannel("partner_pay_channel");
  void check() async{
    print("$status");
  }
  @override
  void initState() {
   super.initState();
   _eventChannel.receiveBroadcastStream().listen((event) {
     final data = Map<String, dynamic>.from(event);

     setState(() {
       status = data['status'] ?? "Unknown"; 
     });
       print("OnBoarding status: $status");
   }, onError: (error){
      print("EventChannel error: $error");
   });
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Проверка авторизации")),
      body: Card(
        child: Column(
          children: [
            Text("Answer is $status"),
            ElevatedButton(
              onPressed: check,
              child: Text("Press")
              ),
          ],
        ),
      ),
    );
  }
}