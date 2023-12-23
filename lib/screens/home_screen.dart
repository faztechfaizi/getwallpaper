import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwallpaper/firebase/googlesignin.dart';
import 'package:getwallpaper/screens/drawerscreen.dart';
import 'package:getwallpaper/screens/full_screen.dart';
import 'package:getwallpaper/screens/welcomescreen.dart';
import 'package:getwallpaper/widget/bottomnavigationbar.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                await FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomeScreen(size: size)));
              },
              icon: (const Icon(Icons.logout_outlined)))
        ],
      ),
      drawer: const DrawerScreen(),




      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('wallpapers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState != ConnectionState.active ||
              !snapshot.hasData) {
            // Handle case when data is still loading or unavailable
            return const CircularProgressIndicator(); // Replace with your preferred loading indicator
          }

          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 400,
              crossAxisCount: 2,
              crossAxisSpacing: 13,
              mainAxisSpacing: 15,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var wallpaper = snapshot.data!.docs[index];
              var imageUrl = wallpaper['url'];

              return GestureDetector(
                onTap: () {
                  // Handle wallpaper selection here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullScreen(imageurl: imageUrl)),
                  );
                },
                child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    height: 500,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        height: 800,
                        width: 50,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

