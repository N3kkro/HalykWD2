import 'package:flutter/material.dart';

class CustomAppBar_IOS extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar_IOS({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
  
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
          Center(
            child: Text("Halyk Widget", 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            ),
            ),
          Positioned(
              top: 30,
              right: 20,
              child: Text("Log out", 
              style: TextStyle(
                color: Colors.red,
              ),),)
          ],
        ),
      ),
    );
  }
  @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}