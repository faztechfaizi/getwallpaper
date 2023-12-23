import 'package:flutter/material.dart';
import 'package:getwallpaper/screens/categorypage.dart';
import 'package:getwallpaper/screens/contactus.dart';
import 'package:getwallpaper/screens/favoritescreen.dart';
import 'package:getwallpaper/screens/home_screen.dart';
import 'package:getwallpaper/screens/privacy_policy.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      radius: 40,
                      backgroundImage: const AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'David John',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.category_outlined,
                color: Colors.white,
              ),
              title: const Text('Collections'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CategoryPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.white,
              ),
              title: const Text('Favorite'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoritesScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_mail_outlined,
                color: Colors.white,
              ),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactUsPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.policy_outlined,
                color: Colors.white,
              ),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyPage()));
              },
            ),

          ],
        ),
      ),
    );
  }
}