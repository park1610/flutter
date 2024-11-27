import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart.dart';
import 'description.dart';
import 'details.dart';
import 'order.dart';
import 'category.dart'; // Ensure this import points to your Category widget.

class barathi extends StatefulWidget {
  barathi({super.key});

  @override
  State<barathi> createState() => _barathiState();
}

class _barathiState extends State<barathi> {
  final List<Map<String, String>> _products = [
    {'image': 'assets/images/Ballchair.jpg', 'name': 'Ballchair'},
    {'image': 'assets/images/Massagechair.jpg', 'name': 'Massagechair'},
    {'image': 'assets/images/Cantileverchair.jpg', 'name': 'Cantileverchair'},
    {'image': 'assets/images/Stoolchair.jpg', 'name': 'Stoolchair'},
    {'image': 'assets/images/Tulipchair.jpg', 'name': 'Tulipchair'},
    {'image': 'assets/images/LadderBackchair.jpg', 'name': 'LadderBackchair'},
    {'image': 'assets/images/Thronechair.jpg', 'name': 'Thronechair'},
    {'image': 'assets/images/Armchair.jpg', 'name': 'Armchair'},
  ];

List<double>imageprice =[10,20,30,40,50,60,70,80]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text("Home"),
      ),      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      
      ),
      body: SafeArea(        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(                  
                    borderRadius: BorderRadius.circular(90),                  
                  ),
                  hintText: "Search you're looking for chair",
                  prefixIcon: Icon(Icons.search)
                ),
              ),
              SizedBox(height: 10),            
              Container(   
                padding: EdgeInsets.zero,                         
                width: MediaQuery.of(context).size.width*1,
                height: 250,              
                 margin: const EdgeInsets.symmetric(horizontal: 7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Ballchair.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Text(
                        'Lifestyle Sale',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 90),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: MaterialButton(
                            onPressed: () {
                              Get.to(() => const Category(category: 'All Category'));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "Shop Now",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(_products.length, (index) {
            final product = _products[index];
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
                                      imageprice: imageprice[index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(product['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Transform.translate(
                                offset: const Offset(70, -70),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 80, vertical: 75),
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
                        );}
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.zero,
        child: NavigationBar(
          indicatorColor: Colors.grey,
          backgroundColor: Colors.white70,
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
      ),
    );
  }
}
