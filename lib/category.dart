import 'package:flutter/material.dart';
import 'package:pargavan/description.dart';
import 'package:pargavan/details.dart';

class Category extends StatefulWidget {
  const Category({super.key, required String category});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, String>> _products = [
    {'image': 'assets/images/Ballchair.jpg', 'name': 'Ball Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Massagechair.jpg', 'name': 'Massage Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Cantileverchair.jpg', 'name': 'Cantilever Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Stoolchair.jpg', 'name': 'Stool Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Tulipchair.jpg', 'name': 'Tulip Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Dinning Table.jpg', 'name': 'Dining Table', 'category': 'Tables'},
    {'image': 'assets/images/Wood Table.jpg', 'name': 'Wood Table', 'category': 'Tables'},
    {'image': 'assets/images/Grey Sofa.jpg', 'name': 'Grey Sofa', 'category': 'Sofas'},
    {'image': 'assets/images/Brown Sofa.jpg', 'name': 'Brown Sofa', 'category': 'Sofas'},
    {'image': 'assets/images/Red Sofa.jpg', 'name': 'Red Sofa', 'category': 'Sofas'},

  ];

   final Map<String, String> productDescriptions = {
  'Ball Chair': 'The Ball Chair is a modern piece of furniture that provides a comfortable and stylish seating experience.',
  'Massage Chair': 'The Massage Chair offers luxurious comfort with relaxing massage features for ultimate relaxation.',
  'Cantilever Chair': 'The Cantilever Chair boasts a sleek, minimalist design with a sturdy metal frame.',
  'Stool Chair': 'The Stool Chair is a compact, versatile seating option, perfect for small spaces.',
  'Tulip Chair': 'The Tulip Chair features a unique design with a flared base and a cozy cushioned seat.',
  'Ladder Back Chair': 'The Ladder Back Chair combines traditional style with modern comfort, featuring a sturdy wooden frame.',
  'Throne Chair': 'The Throne Chair exudes elegance and grandeur, designed to make a bold statement.',
  'Arm Chair': 'The Armchair is a timeless classic with plush cushions and supportive armrests for cozy seating.',
  'Dining Table':'A dining table is a table that is used for having meals on.',
  'Wood Table':'Many tables are made of wood or wood-based products some are made of other materials including metal and glass.',
  'Grey Sofa':'A sofa is a piece of furniture that a few people can comfortably sit on together.',
  'Brown Sofa':'a long upholstered seat usually with arms and a back and often convertible into a bed.',
  'Red Sofa':'a long, soft seat with a back and usually arms, large enough for two or more people to sit on.',
  
};

  final List<double> _prices = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 45, 55, 65];


  final List<String> _categories = ['All', 'Chairs', 'Tables', 'Sofas'];

  String _selectedCategory = 'All';

  List<Map<String, String>> getProductsByCategory(String category) {
    if (category == 'All') {
      return _products;
    }
    return _products.where((product) => product['category'] == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getProductsByCategory(_selectedCategory);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: _selectedCategory == category ? Colors.amber : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: _selectedCategory == category ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,MaterialPageRoute(
                    builder: (context) => Details(
                      image: product['image'] ?? 'default_image_path.png', 
                      imageName: product['name'] ?? 'Unknown Product',
                       description: productDescriptions[product['name'] ] ?? 'Description of the product',
                      imageprice: _prices[index], 
                    ),
                          )
                        );
                      },
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(product['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  product['name']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


