import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details.dart';
import 'cart.dart';
import 'order.dart';
import 'category.dart';

class barathi extends StatefulWidget {
  const barathi({super.key});

  @override
  State<barathi> createState() => _barathiState();
}

class _barathiState extends State<barathi> {
  final List<Map<String, String>> _products = [
    {'image': 'assets/images/Ballchair.jpg', 'name': 'Ball Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Massagechair.jpg', 'name': 'Massage Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Cantileverchair.jpg', 'name': 'Cantilever Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Stoolchair.jpg', 'name': 'Stool Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Tulipchair.jpg', 'name': 'Tulip Chair', 'category': 'Chairs'},
    {'image': 'assets/images/LadderBackchair.jpg', 'name': 'Ladder Back Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Thronechair.jpg', 'name': 'Throne Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Armchair.jpg', 'name': 'Arm Chair', 'category': 'Chairs'},
    {'image': 'assets/images/Dinning Table.jpg', 'name': 'Dinning Table', 'category': 'Tables'},
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
  'Dinning Table':'A dining table is a table that is used for having meals on.',
  'Wood Table':'Many tables are made of wood or wood-based products some are made of other materials including metal and glass.',
  'Grey Sofa':'A sofa is a piece of furniture that a few people can comfortably sit on together.',
  'Brown Sofa':'a long upholstered seat usually with arms and a back and often convertible into a bed.',
  'Red Sofa':'a long, soft seat with a back and usually arms, large enough for two or more people to sit on.',
};

  final List<int> _prices = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 45, 55, 65];  

  List<Map<String, String>> getProductsByCategory(String category) {
    return _products.where((product) => product['category'] == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    final chairs = getProductsByCategory('Chairs');
    final tables = getProductsByCategory('Tables');
    final sofas = getProductsByCategory('Sofas');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                hintText: "Search you're looking for",
                prefixIcon: Icon(Icons.search),                
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(1.0)),
          _buildHorizontalScrollView(),  
          _buildCategorySection('Chairs', chairs),
          _buildCategorySection('Tables', tables),
          _buildCategorySection('Sofas', sofas),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[300],
        onDestinationSelected: (index) {
          if (index == 1) {
            Get.to(() => const Category(category: 'All Category'));
          } else if (index == 2) {
            Get.to(() => const Cart());
          } else if (index == 3) {
            Get.to(() => const Order());
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.select_all_rounded),
            selectedIcon: Icon(Icons.all_out_outlined),
            label: 'All Category',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            selectedIcon: Icon(Icons.menu_open),
            label: 'Order',
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalScrollView() {
    final List<Map<String, String>> banners = [
      {'image': 'assets/images/Chair banner.jpg', 'category': 'Chairs'},
      {'image': 'assets/images/Sofa banner.jpg', 'category': 'Sofas'},
      {'image': 'assets/images/Table banner.jpg', 'category': 'Tables'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: banners.length, 
          itemBuilder: (context, index) {
            final banner = banners[index];
            return GestureDetector(
              onTap: () {
              
                Get.to(() => Category(category: banner['category']!));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(banner['image']!),
                    fit: BoxFit.cover,                    
                  ),
                ),                
              ),                             
            );            
          },
        ),
      ),
    );    
  } 

  Widget _buildCategorySection(String categoryName, List<Map<String, String>> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [          

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   // child: Text(
        //   //   categoryName,
        //   //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //   // ),
        // ),
        // GridView.builder(
        //   shrinkWrap: true,
        //   physics: const BouncingScrollPhysics(),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     crossAxisSpacing: 5,
        //     mainAxisSpacing: 5,
        //     childAspectRatio: 0.6,
        //   ),
        //   itemCount: products.length,
        //   itemBuilder: (context, index) {
        //     final product = products[index];
        //     return GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //           context,MaterialPageRoute(
        //            builder: (context) => Details(
        //             image: product['image'] ?? 'default_image_path.png',
        //             imageName: product['name'] ?? 'Unknown Product',
        //             description: productDescriptions[product['name'] ] ?? 'Description of the product',
        //             imageprice: _prices[index],
        //           ),

        //           ),

        //         );
        //       },
        //       child: Container(
        //         margin: const EdgeInsets.all(8),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           image: DecorationImage(
        //             image: AssetImage(product['image']!),
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
