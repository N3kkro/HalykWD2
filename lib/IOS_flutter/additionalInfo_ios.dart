import 'package:flutter/material.dart';

class AdditionalInfo_ios extends StatelessWidget {
  const AdditionalInfo_ios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              child: Text("Дополнительно", 
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF3C3C43CC),
                ),
              ),
            ),
          ),  
    );
  }
}