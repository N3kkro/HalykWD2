import 'package:flutter/material.dart';
import 'IOS_flutter/ios.dart';
import 'android_flutter/android.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    
    home: Main()
    ));
}
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => IOS_settings()));
              }, 
              child: Text("IOS"),
            ),
            ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Android()));
            }, 
            child: Text('Android'))
          ],
        ),
        
      )
    );
  }
}