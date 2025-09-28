import 'package:flutter/material.dart';

class ProcessList{
  String selectedValue = 'Main view';
  List<String> options =   ['Onboarding', 'QR платеж', 'Main view', 'Card select for refill'];
  List<DropdownMenuItem<String>> get dropdownItems{
     return options.map(
    (item) => DropdownMenuItem<String>(
      value: item,
      child: Text(item),
      ),
    ).toList();
}
}
