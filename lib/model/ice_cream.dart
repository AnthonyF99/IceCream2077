class IceCream {
  final String name;
  final String price;
  final String imagePath;
  final String description;
  final List<String> categories;

  IceCream({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    this.categories = const [],
  });
}
