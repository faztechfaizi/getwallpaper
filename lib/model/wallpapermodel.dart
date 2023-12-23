class Wallpaper {
  final String category;
  final String collections;
  final String imageUrl;

  Wallpaper({required this.category, required this.collections, required this.imageUrl});

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      category: json['category'],
      collections: json['wallpapers'],
      imageUrl: json['url'],
    );
  }
}

