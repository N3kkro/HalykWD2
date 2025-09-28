import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onboarding_IOS extends StatefulWidget {
  const Onboarding_IOS({super.key});

  @override
  State<Onboarding_IOS> createState() => _Onboarding_IOSState();
}

class _Onboarding_IOSState extends State<Onboarding_IOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: Text("ДОПОЛНИТЕЛЬНО"),
      children: [
        Row(
          children: [
            Expanded(
              child: CupertinoTextFormFieldRow(
                prefix: Text("ID"),
                placeholder: "Insert Corelation ID",
              ),
            ),
          ],
        )
      ],
    );
  }
}