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
    {'image': 'assets/images/one.jpg', 'name': 'Ballchair'},
    {'image': 'assets/images/two.jpg', 'name': 'Massagechair'},
    {'image': 'assets/images/three.jpg', 'name': 'Cantileverchair'},
    {'image': 'assets/images/four.jpg', 'name': 'Stoolchair'},
    {'image': 'assets/images/five.jpg', 'name': 'Tulipchair'},
    {'image': 'assets/images/six.jpg', 'name': 'Ladderbackchair'},
    {'image': 'assets/images/seven.jpg', 'name': 'Thronechair'},
    {'image': 'assets/images/eight.jpg', 'name': 'Armchair'},
     {'image': 'assets/images/three.jpg', 'name': 'Cantileverchair'},
    {'image': 'assets/images/four.jpg', 'name': 'Stoolchair'},
    {'image': 'assets/images/five.jpg', 'name': 'Tulipchair'},
    {'image': 'assets/images/six.jpg', 'name': 'Ladderbackchair'},
    {'image': 'assets/images/seven.jpg', 'name': 'Thronechair'},
    {'image': 'assets/images/eight.jpg', 'name': 'Armchair'},
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
            physics: BouncingScrollPhysics(),      
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
                        image: product['image']!,
                        imageName: product['name']!,
                        description:
                            productDescriptions[product['name']] ?? 'No description available for this product',
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
                            size: 15,
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
