import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QRPayment_IOS extends StatefulWidget {
  const QRPayment_IOS({super.key});

  @override
  State<QRPayment_IOS> createState() => _QRPayment_IOSState();
}

class _QRPayment_IOSState extends State<QRPayment_IOS> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoListSection(
          header: Text("ДОПОЛНИТЕЛЬНОЕ",),
          footer: Text("Если поле QR пустым, сканер запуститься автоматически",
          style: TextStyle(
            fontSize: 15,
          ),
          ),
          children: [
            Row(
             children: [
               Expanded(
                 child: CupertinoTextFormFieldRow(
                   prefix: Text("ID"),
                   obscureText: true,
                   placeholder: "Insert Corelation ID",
                 
                 ),
               
               ),
             ]
            ),
             Row(
             children: [
               Expanded(
                 child: CupertinoTextFormFieldRow(
                   prefix: Text("QR"),
                   obscureText: true,
                   placeholder: "Insert QR code sring",
                 
                 ),
               
               ),
             ]
            ),
            
          ],
          
        ),
      ],
    );
  }
}