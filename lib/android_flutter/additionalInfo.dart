import 'package:flutter/material.dart';

class Additionalinfo extends StatefulWidget {
  const Additionalinfo({super.key});

  @override
  State<Additionalinfo> createState() => _AdditionalinfoState();
}

class _AdditionalinfoState extends State<Additionalinfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F7),   
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Дополнительное'),
        ),  
      ),
    );
  }
}