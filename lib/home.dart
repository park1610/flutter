import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pargavan/cart.dart';
import 'package:pargavan/description.dart';
import 'package:pargavan/details.dart';
import 'package:pargavan/order.dart';
import 'category.dart'; // Ensure this import points to your Category widget.

class barathi extends StatelessWidget {
  barathi({super.key});

  final List<Map<String, String>> _products = [
    {'image': 'assets/images/one.jpg', 'name': 'Ballchair'},
    {'image': 'assets/images/two.jpg', 'name': 'Massagechair'},
    {'image': 'assets/images/three.jpg', 'name': 'Cantileverchair'},
    {'image': 'assets/images/four.jpg', 'name': 'Stoolchair'},
    {'image': 'assets/images/five.jpg', 'name': 'Tulipchair'},
    {'image': 'assets/images/six.jpg', 'name': 'Ladderbackchair'},
    {'image': 'assets/images/seven.jpg', 'name': 'Thronechair'},
    {'image': 'assets/images/eight.jpg', 'name': 'Armchair'},
  ];
  
  get onDestinationSelected => null;

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
        child: Container(  
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(                                  
                  border: OutlineInputBorder(                    
                    borderRadius: BorderRadius.circular(50),  
                  ),
                  hintText: "Search you're Looking For",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/one.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
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
                  children: _products
                      .map(
                        (product) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(
                                  image: product['image']!,
                                  imageName: product['name']!,
                                  description:
                                      productDescriptions[product['name']] ??
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
                              child: Transform.translate(
                                offset: const Offset(50, -50),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 65, vertical: 63),
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
            }
            else  if (index == 2) {
              Get.to(() => const Cart());
            }
            else if (index == 3 ) {
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



