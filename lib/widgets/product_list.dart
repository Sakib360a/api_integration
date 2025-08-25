import 'package:flutter/material.dart';
import '../screens/product_update_screen.dart';
class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      leading: CircleAvatar(
        radius: 25,
      ),
      title: Text('Product Name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: 5FBC'),
          Row(
            spacing: 16,
            children: [Text('In Stock: 5'), Text('Unit Price: 500')],
          ),
        ],
      ),
      trailing: PopupMenuButton<ProductOptions>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: ProductOptions.update,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 10,
                children: [
                  Image.asset('assets/icons/update_icon.png', scale: 21),
                  Text('Update'),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: ProductOptions.delete,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 10,
                children: [
                  Image.asset('assets/icons/delete_icon.png', scale: 21),
                  Text('Delete'),
                ],
              ),
            ),
          ),
        ],
        onSelected: (ProductOptions selectedOptions){
          if(selectedOptions == ProductOptions.update)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductUpdateScreen()));
          }
          else if(selectedOptions == ProductOptions.delete){
            print('Delete');
          }
        },
      ),
    );
  }
}
enum ProductOptions { update, delete }