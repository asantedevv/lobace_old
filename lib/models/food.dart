class Food{
  final int id;
  final String name;
  final String image; // Base64 encoded image
  final String price;

  Food({required this.name, required this.image, required this.id, required this.price});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'] ?? 'Unknown', // Default value if null
      image: json['image'] ?? '', // Default to an empty string if null
      id: json['id'] ?? '', // Default value if null
      price: json['price'] ?? '', 
    );
  }
}
