import 'package:flutter/material.dart';
import 'package:getwallpaper/constants/textstring.dart';
import 'package:getwallpaper/firebase/googlesignin.dart';
import 'package:getwallpaper/screens/home_screen.dart';
import 'package:getwallpaper/screens/loginscreen/login_screen.dart';
import 'package:getwallpaper/screens/signupscreen/signupform.dart';
import 'package:getwallpaper/screens/signupscreen/signuphaeder.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30,),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignupHeader(),
              const SizedBox(
                height: 50,
              ),
              const SignUpForm(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  withsocial,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: () async{
                          await FirebaseServices().signInWithGoogle();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                        },
                        icon: const Image(
                          image: AssetImage('assets/images/google.png'),
                          width: 20,
                        ),
                        label: Text('Google',
                            style: Theme.of(context).textTheme.subtitle2),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.yellow),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(
                            'assets/images/facebook.png',
                          ),
                          height: 35,
                        ),
                        label: Text(
                          'Facebook',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Text.rich(TextSpan(
                      text: haveaccount,
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                        TextSpan(
                          text: signin,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: const Color(0xfff615DB4)),
                        ),
                      ]
                  ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}




