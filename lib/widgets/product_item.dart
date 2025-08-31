import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../utils/urls.dart';
import '../screens/product_update_screen.dart';
import 'package:http/http.dart';

class ProductName extends StatefulWidget {
  const ProductName({
    super.key,
    required this.product,
    required this.refreshProductList,
  });
  final ProductModel product;
  final VoidCallback refreshProductList;

  @override
  State<ProductName> createState() => _ProductNameState();
}

class _ProductNameState extends State<ProductName> {
  bool _deleteInProgress = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      leading: Image.network(
        width: 40,
        widget.product.img,
        scale: 1,
        errorBuilder: (_, __, ___) {
          return Icon(Icons.error_outline, size: 40);
        },
      ),
      title: Text(widget.product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: ${widget.product.code.toString()}'),
          Row(
            spacing: 16,
            children: [
              Text('Quantity: ${widget.product.qty.toString()}'),
              Text('Unit Price: ${widget.product.price.toString()}'),
            ],
          ),
        ],
      ),
      trailing: Visibility(
        visible: _deleteInProgress == false,
        replacement: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
        child: PopupMenuButton<ProductOptions>(
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
          onSelected: (ProductOptions selectedOptions) {
            if (selectedOptions == ProductOptions.update) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductUpdateScreen(
                    product: widget.product,
                    refreshProductList: () {
                      setState(() {
                        widget.refreshProductList();
                      });
                    },
                  ),
                ),
              );
            } else if (selectedOptions == ProductOptions.delete) {
              _deleteProduct();
            }
          },
        ),
      ),
    );
  }

  Future<void> _deleteProduct() async {
    _deleteInProgress = true;
    setState(() {});
    Uri url = Uri.parse(Urls.deleteProductUrls(widget.product.id));
    Response response = await get(url);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      if (decodedJson['status'] == 'success') {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Product deleted successfully')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Something went wrong')));
      }
      widget.refreshProductList();
    }
    _deleteInProgress = false;
    setState(() {});
  }
}

enum ProductOptions { update, delete }
