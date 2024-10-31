class Restaurant {
  final String name;
  final String category;
  final int id;
  final String image; // Base64 encoded image

  Restaurant({required this.name, required this.image, required this.id, required this.category});












  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'] ?? 'Unknown', // Default value if null
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      id: json['id']?? 0, // Default to an empty string if null
    );
  }
}
