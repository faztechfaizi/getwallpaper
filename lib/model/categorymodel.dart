import 'package:cloud_firestore/cloud_firestore.dart';


class CategoryService {
  static Future<List<String>> fetchCategories() async {
    try {
      CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection('wallpapers');
      QuerySnapshot categoriesSnapshot = await categoriesCollection.get();
      List<String> categories = categoriesSnapshot.docs
          .map((document) =>
      (document.data() as Map<String, dynamic>)['category'] as String)
          .toList();

      return categories;
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }

  static Future<List<String>> fetchCategoryImages(String category) async {
    try {
      CollectionReference wallpapersCollection =
      FirebaseFirestore.instance.collection('wallpapers');
      QuerySnapshot wallpapersSnapshot =
      await wallpapersCollection.where('category', isEqualTo: category).get();

      List<String> imageUrls = wallpapersSnapshot.docs
          .map((document) =>
      (document.data() as Map<String, dynamic>)['url'] as String)
          .toList();

      return imageUrls;
    } catch (e) {
      print('Error fetching category images: $e');
      return [];
    }
  }
}
