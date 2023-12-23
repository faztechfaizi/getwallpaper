import 'package:flutter/material.dart';
import 'package:getwallpaper/constants/textstring.dart';
import 'package:getwallpaper/firebase/googlesignin.dart';
import 'package:getwallpaper/screens/loginscreen/login_screen.dart';
import 'package:getwallpaper/screens/signupscreen/signupscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key,
    required this.size,}) : super(key: key);

  final Size size;


  @override
  Widget build(BuildContext context) {
   double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(

        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/wlcm.png',

                height: height * 1,
                width: width * 1,

              ),

              Positioned(
                top: height * 0.40,
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.3,
                  child: Image.asset(
                    'assets/images/fazwall.png',


                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.39,
                child: const Text(
                  welcometext,
                  style: TextStyle(
                    fontFamily: 'SubFont',
                    fontSize: 14,
                    color: Color(0xfff414753)
                  )
                ),
              ),
              Positioned(
                top: height * 0.66,
                child: SizedBox(
                  width: width * 0.85,
                  height: 50,
                  child: ElevatedButton.icon(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                  },
                    icon: const Icon(Icons.mail),
                    style: ElevatedButton.styleFrom(
                        elevation: 10
                    ),
                    label: Text('Continue With Email',
                        style: Theme.of(context).textTheme.subtitle1),

                  ),
                ),
              ),
              Positioned(
              top: height * 0.74,
                child: SizedBox(
                  width: width * 0.85,
                  height: 50,
                  child: OutlinedButton.icon(onPressed: () {
                    signInGoogle(context);
                  },
                    icon: const Image(image: AssetImage('assets/images/google.png'),width: 20,),
                    label: Text('Continue with Google',
                        style: Theme.of(context).textTheme.subtitle2
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 1,
                          color: Colors.yellow
                      ),

                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.81,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                    },
                    child: Text.rich(TextSpan(
                        text: donthaveacount,
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          TextSpan(
                              text: signup,
                              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                  color: const Color(0xfff615DB4)
                              )),
                        ])),
                  ),
                ),
              ),



            ],
          ),






        ],
      ),
    ));
  }
}
