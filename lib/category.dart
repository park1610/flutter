import 'package:flutter/material.dart';
import 'package:pargavan/description.dart';
import 'package:pargavan/details.dart';

class Category extends StatefulWidget {
  final String category;

  const Category({super.key, required this.category});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, String>> products = [
    {'image': 'assets/images/Ballchair.jpg', 'name': 'Ball Chair'},
    {'image': 'assets/images/Massagechair.jpg', 'name': 'Massage Chair'},
    {'image': 'assets/images/Cantileverchair.jpg', 'name': 'Cantilever Chair'},
    {'image': 'assets/images/Stoolchair.jpg', 'name': 'Stool Chair'},
    {'image': 'assets/images/Tulipchair.jpg', 'name': 'Tulip Chair'},
    {'image': 'assets/images/LadderBackchair.jpg', 'name': 'Ladder Back Chair'},
    {'image': 'assets/images/Thronechair.jpg', 'name': 'Throne Chair'},
    {'image': 'assets/images/Armchair.jpg', 'name': 'Arm Chair'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(widget.category),
      ),
      body: Container(
        color: Colors.grey,
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
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                     builder: (context) => Details(
                                image: product['image'] ?? 'assets/images/default.jpg',
                                imageName: product['name'] ?? 'Unknown Product',
                                description: productDescriptions[product['name']] ??
                                    'No description available for this product',
                      ),
                    ),
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
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.bookmark_border,
                            size: 20,
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
    );
  }
}
