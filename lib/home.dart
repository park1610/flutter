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

  final List<Map<String, String>> popularProducts = [
    {'popular': 'assets/images/Stoolchair.jpg', 'name': 'Stool Chair', 'category': 'Chairs'},
    {'popular': 'assets/images/Cantileverchair.jpg', 'name': 'Cantilever Chair', 'category': 'Chairs'},
    {'popular': 'assets/images/Wood Table.jpg', 'name': 'Wood Table', 'category': 'Tables'},
    {'popular': 'assets/images/Brown Sofa.jpg', 'name': 'Brown Sofa', 'category': 'Sofas'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(title: Text('Profile')),
            ListTile(title: Text('Account')),
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
                  borderSide: const BorderSide(width: 0.8),
                ),
                hintText: "Search what you're looking for",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          _buildHorizontalScrollView(),
          _buildCategoryIcons(),
          _buildPopularProductsList(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[300],
        onDestinationSelected: (index) {
          if (index == 1) {
            Get.to(() => const Cart());
          } else if (index == 2) {
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
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: banners.length,
          itemBuilder: (context, index) {
            final banner = banners[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => Category(category: banner['category']!));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
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

  Widget _buildCategoryIcons() {
    final List<Map<String, dynamic>> categories = [
      {'name': 'All', 'icon': Icons.apps, 'category': 'All', 'color': Colors.blue},
      {'name': 'Chairs', 'icon': Icons.chair_outlined, 'category': 'Chairs', 'color': Colors.green},
      {'name': 'Tables', 'icon': Icons.table_bar_outlined, 'category': 'Tables', 'color': Colors.orange},
      {'name': 'Sofas', 'icon': Icons.weekend_outlined, 'category': 'Sofas', 'color': Colors.purple},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'All Categories',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 25,
          runSpacing: 10,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                Get.to(() => Category(category: category['category']));
              },
              child: Column(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: category['color'],
                      shape: BoxShape.rectangle,
                    ),
                    child: Icon(
                      category['icon'],
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPopularProductsList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: popularProducts.length,
            itemBuilder: (context, index) {
              final product = popularProducts[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => Category(category: product['category']!));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        product['popular']!,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    title:  Text(
                          '${product['name']}',
                        style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      product['name']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
