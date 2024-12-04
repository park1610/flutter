
import 'package:flutter/material.dart';
import 'package:pargavan/category.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cart page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.7,
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage("assets/images/icon.jpg"),
                  fit: BoxFit.cover,
                  )
              ),
            ),
            Padding(            
              padding: EdgeInsets.all(20),
              child: Text(
                'Your Cart Is Empty  ',              
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.deepPurple[900],
                ),
              ),          
               ),
               Text( 
                textAlign: TextAlign.center,               
                "Looks Like You haven't added anything to your cart yet",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold
                ),
               ), 
               SizedBox(height: 30),
               SizedBox(
                 width: double.infinity,
                 height: 60,
                 child: ElevatedButton.icon(onPressed: (){
                    Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Category(category: '',)),
                    );                                    
                  },                
                   icon:  Icon(Icons.shopping_bag_outlined,color: Colors.black, size: 30), 
                            
                  label: Text(
                    "SHOP NOW ",
                    style: TextStyle(color: Colors.black,
                    fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 179, 149, 228),
                    ),
                  ),
                  
               ) 
              ],  
        
          
        ),
      ),
      
    );
  }
}

