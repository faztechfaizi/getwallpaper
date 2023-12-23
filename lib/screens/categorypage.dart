import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:getwallpaper/model/categorymodel.dart';
import 'package:getwallpaper/screens/categoryimage.dart';
import 'package:getwallpaper/screens/drawerscreen.dart';

class Wallpaper {
  final String imageUrl;
  final String category;

  Wallpaper({required this.imageUrl, required this.category});
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Wallpaper> wallpapers = [];

  @override
  void initState() {
    super.initState();
    fetchCategoriesAndImages();
  }

  Future<void> fetchCategoriesAndImages() async {
    try {
      List<String> categories = await CategoryService.fetchCategories();

      for (String category in categories) {
        List<String> imageUrls =
            await CategoryService.fetchCategoryImages(category);

        if (imageUrls.isNotEmpty) {
          String imageUrl = imageUrls.first;

          bool categoryExists =
              wallpapers.any((wallpaper) => wallpaper.category == category);
          if (!categoryExists) {
            Wallpaper wallpaper =
                Wallpaper(imageUrl: imageUrl, category: category);
            wallpapers.add(wallpaper);
          }
        }
      }

      setState(() {});
    } catch (e) {
      print('Error fetching categories and images: $e');
    }
  }

  void showCategoryImages(String category) async {
    try {
      List<String> imageUrls =
          await CategoryService.fetchCategoryImages(category);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CategoryImagesPage(category: category, imageUrls: imageUrls),
        ),
      );
    } catch (e) {
      print('Error fetching category images: $e');
    }
  }

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: const Text(
                'Collections',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'MainFont',
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(15),
              itemCount: wallpapers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                Wallpaper wallpaper = wallpapers[index];
                return GridTile(
                  child: GestureDetector(
                    onTap: () {
                      showCategoryImages(wallpaper.category);
                    },
                    child: Container(
                      width: size.width * 0.5,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: wallpaper.imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Positioned(
                            bottom: 60,
                            left: 20,
                            child: Text(
                              wallpaper.category,
                              style: const TextStyle(
                                fontSize: 35,
                                fontFamily: 'SubFont',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
