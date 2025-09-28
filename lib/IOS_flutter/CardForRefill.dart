import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CardSelectForRefill extends StatelessWidget {
  const CardSelectForRefill({super.key});

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