import 'package:flutter/material.dart';
import 'package:getwallpaper/firebase/googlesignin.dart';
import 'package:getwallpaper/screens/welcomescreen.dart';
import 'package:getwallpaper/widget/bottomnavigationbar.dart';
import 'package:like_button/like_button.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/images/fazwall.png',
          width: size.width * 0.45,
        ),
        actions: [
          const Padding(padding: EdgeInsets.all(20)),
          IconButton(
              onPressed: () async{
                await FirebaseServices().signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomeScreen(size: size)));
              },
              icon: (const Icon(Icons.logout_outlined)))
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: Center(
        child: LikeButton(
          size: 200,
          circleColor:
          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          animationDuration: const Duration(milliseconds: 2000),
          bubblesColor: const BubblesColor(
            dotPrimaryColor: Colors.red, dotSecondaryColor: Colors.white,

          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.heart_broken_sharp,
              color: isLiked ? Colors.redAccent : Colors.grey,
              size: 200,
            );
          },


        ),
      ),




    );
  }
}
