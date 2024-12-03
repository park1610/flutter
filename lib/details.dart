
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pargavan/cart.dart';
import 'package:pargavan/description.dart';

class Details extends StatefulWidget {
  final String image;       // Image path
  final String imageName;   // Image Name or Title
  final double? imageprice; // Nullable price
  final String description; // Description of the product

  const Details({
    super.key,
    required this.image,
    required this.imageName,
    required this.description,
    this.imageprice, 
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      widget.imageName,                    
                      style: const TextStyle(   
                        fontSize: 25,
                        fontWeight: FontWeight.w900,                      
                      ),
                    ),
                                      
                  ],
                ),                
                const SizedBox(height: 10),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Available Colors',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    SizedBox(width: 5.0),
                     CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 5.0),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.yellow,
                    ),
                    SizedBox(width: 5.0),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.purple,
                    ),
                  ],
                )            
              ],
            ),          
          ),
        ],
      ),         
      bottomSheet: BottomAppBar( 
        padding: EdgeInsets.zero,        
        shape:const CircularNotchedRectangle(),           
          child: Container(            
            padding:const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height*10,        
            decoration: BoxDecoration( 
              shape: BoxShape.rectangle,           
              color: Colors.grey[300],                                                 
              borderRadius:  BorderRadius.circular(10)
                      
                                       
              
            ),
            child: Row(
              children: [   
                Text(
                      '₹${widget.imageprice!.toStringAsFixed(0)}' ,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),                            
                Padding(
                  padding: const EdgeInsets.only(left: 160),                  
                  child: ElevatedButton.icon(onPressed: (){
                    Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Cart()),
                    );                                    
                  },                
                  icon: const Icon(Icons.shopify,color: Colors.black, size: 20),          
                  label: const Text(
                    'Buy Now' ,
                    style: TextStyle(color: Colors.black,fontSize: 15),
                    ),                                
                  ),
                )
              ],
            ),
          ),
        ),     
      
    );
  }
}
