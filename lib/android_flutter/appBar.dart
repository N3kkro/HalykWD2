import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});
  //android
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
    preferredSize: Size.fromHeight(60), 
    child: Stack(
      children: [
        Positioned(
          left: 16,
          top: 20,
          child: Text(
          "Halyk Widget",
          style: TextStyle(
            fontSize: 20,
          ),
          ),
        ),
        Positioned(
          top: 20,
          right: 16,
          child: Text("Log out", 
          style: TextStyle(
            color: Colors.red,
          ),),
          )
      ],
    ),
    );
  }
  @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}