import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwallpaper/screens/drawerscreen.dart';
import 'package:getwallpaper/screens/full_screen.dart';

class CategoryImagesPage extends StatelessWidget {
  final String category;
  final List<String> imageUrls;

  const CategoryImagesPage({super.key, required this.category, required this.imageUrls});

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

      ),
      drawer: const DrawerScreen(),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 400,
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 15

        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          String imageUrl = imageUrls[index];
          return GestureDetector(
            onTap: () {
              // Handle wallpaper selection here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FullScreen(imageurl: imageUrl)),
              );
            },
            child: GridTile( child: Container(
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),




            ),
          );
        },
      ),
    );
  }
}
