class ProductModel {
  final int id;
  final int categoryId;
  final String name;
  final String imageUrl;
  final int quantity;
  final String unit;
  final String detail;
  final double price;

  ProductModel(
    this.id,
    this.categoryId,
    this.name,
    this.imageUrl,
    this.quantity,
    this.unit,
    this.detail,
    this.price,
  );

  static List<ProductModel> fakeData() {
    return <ProductModel>[
      ProductModel(
        1,
        1,
        "Organic Bananas",
        "assets/img/product/organic_banana.png",
        7,
        "7pcs, Priceg",
        "Organic bananas are rich in potassium and fiber,"
            " making them a great snack for energy and digestion."
            " Perfect for smoothies, baking, or eating fresh.",
        4.99,
      ),
      ProductModel(
        2,
        1,
        "Red Apple",
        "assets/img/product/red_apple.png",
        1,
        "1kg, Priceg",
        "Crisp and sweet, red apples are a healthy snack option. "
            "They are packed with antioxidants and vitamins to support overall health.",
        4.99,
      ),
      ProductModel(
        3,
        2,
        "Bell Pepper Red",
        "assets/img/product/bell_pepper_red.png",
        5,
        "1kg, Priceg",
        "Fresh red bell peppers are crunchy and sweet."
            " They are perfect for salads, stir-fries,"
            " or as a healthy snack with dips.",
        4.99,
      ),
      ProductModel(
        4,
        2,
        "Ginger",
        "assets/img/product/ginger.png",
        2,
        "1kg, Priceg",
        "Ginger is a versatile root known for"
            " its spicy flavor and health benefits."
            " Use it in teas, cooking, or baking for a zesty kick.",
        1.99,
      ),
      ProductModel(
        5,
        3,
        "Broiler Chicken",
        "assets/img/product/broiler_chicken.png",
        2,
        "1kg, Priceg",
        "Fresh broiler chicken is tender and juicy, ideal for grilling, "
            "roasting, or frying. A great source of protein for your meals.",
        3.99,
      ),
      ProductModel(
        6,
        3,
        "Beef Bone",
        "assets/img/product/beef_bone.png",
        2,
        "1kg, Priceg",
        "Beef bones are perfect for making rich and flavorful broths or soups."
            " They are packed with nutrients and collagen.",
        4.99,
      ),
      ProductModel(
        7,
        6,
        "Diet Coke",
        "assets/img/product/diet_coke.png",
        9,
        "355ml, Price",
        "Diet Coke is a refreshing, sugar-free soda with a classic cola taste."
            " Perfect for those looking to enjoy a low-calorie beverage.",
        1.99,
      ),
      ProductModel(
        8,
        6,
        "Sprite",
        "assets/img/product/sprite_can.png",
        8,
        "325ml, Price",
        "Sprite is a crisp and refreshing lemon-lime soda."
            " Enjoy it chilled for a burst of citrusy flavor.",
        1.99,
      ),
      ProductModel(
        9,
        6,
        "Apple & Grape Juice",
        "assets/img/product/apple_grape.png",
        8,
        "2L, Price",
        "A delicious blend of apple and grape juice,"
            " perfect for breakfast or"
            " as a refreshing drink throughout the day.",
        1.99,
      ),
      ProductModel(
        10,
        6,
        "Orange Juice",
        "assets/img/product/orenge_juice.png",
        7,
        "2L, Price",
        "Freshly squeezed orange juice with no added sugar."
            " A great source of vitamin C to boost your immune system.",
        1.99,
      ),
      ProductModel(
        11,
        6,
        "Coca Cola Can",
        "assets/img/product/coca_cola_can.png",
        14,
        "325ml, Price",
        "Coca Cola is a classic soda with a bold and refreshing taste."
            " Perfect for any occasion, served chilled.",
        1.99,
      ),
      ProductModel(
        12,
        6,
        "Pepsi Can",
        "assets/img/product/pepsi_can.png",
        11,
        "330ml, Prices",
        "Pepsi is a popular cola beverage with a sweet and refreshing flavor."
            " Enjoy it cold for the best experience.",
        2.99,
      ),
    ];
  }
}
