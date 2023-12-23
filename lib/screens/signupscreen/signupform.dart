
import 'package:flutter/material.dart';
import 'package:getwallpaper/constants/textstring.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getwallpaper/screens/home_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _usernameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: const Color(0xfff414753),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                hintText: username,
                hintStyle: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: const Color(0xfff414753),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                hintText: enteremail,
                hintStyle: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: const Color(0xfff414753),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                hintText: enterpswrd,
                hintStyle: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text,
                    password: _passwordController.text).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const HomeScreen()));
                }).onError((error, stackTrace) {
                  print('Error${error.toString()}');
                });

              }, child: Text(register,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}