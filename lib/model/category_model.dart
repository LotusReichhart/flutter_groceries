import 'dart:ui';

class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;
  final Color color;

  CategoryModel(this.id, this.name, this.imageUrl, this.color);

  static List<CategoryModel> fakeData() {
    return <CategoryModel>[
      CategoryModel(
        1,
        "Frash Fruits & Vegetable",
        "assets/img/category/frash_fruits.png",
        Color(0xFF53B175),
      ),
      CategoryModel(
        2,
        "Cooking Oil & Ghee",
        "assets/img/category/cooking_oil.png",
        Color(0xFFF8A44C),
      ),
      CategoryModel(
        3,
        "Meat & Fish",
        "assets/img/category/meat_fish.png",
        Color(0xFFF7A593),
      ),
      CategoryModel(
        4,
        "Bakery & Snacks",
        "assets/img/category/bakery_snacks.png",
        Color(0xFFD3B0E0),
      ),
      CategoryModel(
        5,
        "Dairy & Eggs",
        "assets/img/category/dairy_eggs.png",
        Color(0xFFFDE598),
      ),
      CategoryModel(
        6,
        "Beverages",
        "assets/img/category/beverages.png",
        Color(0xFFB7DFF5),
      ),
    ];
  }
}
