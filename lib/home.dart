import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart.dart';
import 'details.dart';
import 'order.dart';
import 'category.dart';

class barathi extends StatefulWidget {
  const barathi({super.key});

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

  List<double> imageprice = [10, 20, 30, 40, 50, 60, 70, 80];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.sort_rounded),
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
      body: CustomScrollView(  
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(9.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment. start,                
                children: <Widget> [                  
                  Text(
                    'What Would ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),                    
                    ),
                    SizedBox(height: 5,),  
                    Text(
                      'You like',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ) ,              
                    
                    
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintText: "Search you're Looking For",
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: Container(                      
                      padding: EdgeInsets.all(10),                                          
                      color: Colors.grey[400],
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          final product = _products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(
                                    image: product['image']!,
                                    imageName: product['name'] ?? 'Unknown Product',
                                    description:
                                        'No description available for this product',
                                    imageprice: imageprice[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              margin: const EdgeInsets.symmetric(horizontal: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  image: AssetImage(product['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = _products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            image: product['image']!,
                            imageName: product['name'] ?? 'Unknown Product',
                            description:
                                'No description available for this product',
                            imageprice: imageprice[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(product['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              product['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: _products.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.zero,
        child: NavigationBar(
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
      ),
    );
  }
}
