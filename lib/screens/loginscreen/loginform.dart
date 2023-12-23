import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwallpaper/constants/textstring.dart';
import 'package:getwallpaper/firebase/googlesignin.dart';
import 'package:getwallpaper/screens/forgot_screen.dart';
import 'package:getwallpaper/screens/home_screen.dart';
import 'package:getwallpaper/screens/signupscreen/signupscreen.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: const Color(0xfff414753),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                hintText: enteremail,
                hintStyle: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: const Color(0xfff414753),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                hintText: enterpswrd,
                hintStyle: Theme.of(context).textTheme.subtitle2,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotScreen(),
                    ),
                  );
                },
                child: Text(
                  forgtpswrd,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: const Color(0xfff615DB4)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  )
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }).onError((error, stackTrace) {});
                },
                child: Text(
                  login,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Text(
                withsocial,
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                icon: const Image(
                  image: AssetImage('assets/images/google.png'),
                  width: 20,
                ),
                label: Text(
                  signingoogle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Image(
                  image: AssetImage('assets/images/facebook.png'),
                  height: 35,
                ),
                label: Text(
                  signinfb,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    text: donthaveacount,
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                        text: signup,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: const Color(0xfff615DB4)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
