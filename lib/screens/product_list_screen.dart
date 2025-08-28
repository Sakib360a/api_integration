import 'package:api_test/screens/product_update_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/product_list.dart';
import 'add_new_product_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => ProductName(),
        separatorBuilder: (context, index) => Divider(indent: 70),
      ),
      floatingActionButton: SizedBox(
        width: 110,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProductScreen()),
            );
          },
          child: Row(
            spacing: 0,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/icons/add_icon.png', scale: 18),
              Text('Add new', style: TextStyle(color: Color(0xff001F3F))),
            ],
          ),
        ),
      ),
    );
  }
}




