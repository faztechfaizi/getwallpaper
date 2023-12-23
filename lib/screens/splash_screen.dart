import 'package:flutter/material.dart';
import 'package:getwallpaper/screens/onboardscreen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    _navigatetohome();

  }
  _navigatetohome()async{
    await Future.delayed(const Duration(seconds: 2),(){

    });
    Navigator.pushReplacement(context, MaterialPageRoute
      (builder: (context)=> const OnBoardScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset('assets/images/splashscreen.jpg',fit: BoxFit.cover,
        height: double.infinity,
          width: double.infinity,
        ),
      ),


    );
  }
}

