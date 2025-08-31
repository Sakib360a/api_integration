import 'dart:convert';

import 'package:api_test/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../utils/urls.dart';

class ProductUpdateScreen extends StatefulWidget {
  const ProductUpdateScreen({
    super.key,
    required this.product,
    required this.refreshProductList,
  });
  final ProductModel product;
  final VoidCallback refreshProductList;
  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreen();
}

class _ProductUpdateScreen extends State<ProductUpdateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _imageUrlTEController = TextEditingController();

  bool _updateInProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTEController.text = widget.product.name;
    _codeTEController.text = widget.product.code.toString();
    _quantityTEController.text = widget.product.qty.toString();
    _priceTEController.text = widget.product.price.toString();
    _imageUrlTEController.text = widget.product.img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter product name',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(
                      0xffc1d4ef,
                    ).withOpacity(0.3), // Or a light shade that contrasts well
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6).withOpacity(0.7),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'Product Name',
                    labelStyle: TextStyle(color: Color(0xFF40a1c6)),
                  ),
                  style: TextStyle(color: Colors.black87, fontSize: 16.0),
                  cursorColor: Color(0xFF40a1c6), // Matches the app bar color
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _codeTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'e.g. B12F',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(
                      0xffc1d4ef,
                    ).withOpacity(0.3), // Or a light shade that contrasts well
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6).withOpacity(0.7),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'Product Code',
                    labelStyle: TextStyle(color: Color(0xFF40a1c6)),
                  ),
                  style: TextStyle(color: Colors.black87, fontSize: 16.0),
                  cursorColor: Color(0xFF40a1c6), // Matches the app bar color
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _quantityTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product quantity';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'e.g. 10',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(
                      0xffc1d4ef,
                    ).withOpacity(0.3), // Or a light shade that contrasts well
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6).withOpacity(0.7),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'Quantity',
                    labelStyle: TextStyle(color: Color(0xFF40a1c6)),
                  ),
                  style: TextStyle(color: Colors.black87, fontSize: 16.0),
                  cursorColor: Color(0xFF40a1c6), // Matches the app bar color
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _priceTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product price';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'e.g. 500',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(
                      0xffc1d4ef,
                    ).withOpacity(0.3), // Or a light shade that contrasts well
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6).withOpacity(0.7),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'Unit Price',
                    labelStyle: TextStyle(color: Color(0xFF40a1c6)),
                  ),
                  style: TextStyle(color: Colors.black87, fontSize: 16.0),
                  cursorColor: Color(0xFF40a1c6), // Matches the app bar color
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _imageUrlTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product image url';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'https://drive.google.com/image',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(
                      0xffc1d4ef,
                    ).withOpacity(0.3), // Or a light shade that contrasts well
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6).withOpacity(0.7),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF40a1c6),
                        width: 2.5,
                      ),
                    ),
                    labelText: 'Image Url',
                    labelStyle: TextStyle(color: Color(0xFF40a1c6)),
                  ),
                  style: TextStyle(color: Colors.black87, fontSize: 16.0),
                  cursorColor: Color(0xFF40a1c6), // Matches the app bar color
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Visibility(
                    visible: _updateInProgress==false,
                      replacement: Center(child: CircularProgressIndicator()),
                      child: FilledButton(onPressed: _updateProduct, child: Text('Update'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _updateProduct() async {
    _updateInProgress = true;
    setState(() {});

    try {
      Uri url = Uri.parse(Urls.updateProductUrls(widget.product.id));

      Map<String, dynamic> requestBody = {
        'ProductName': _nameTEController.text.trim(),
        'ProductCode': int.parse(_codeTEController.text.trim()),
        'Img': _imageUrlTEController.text.trim(),
        'Qty': int.parse(_quantityTEController.text.trim()),
        'UnitPrice': double.parse(_priceTEController.text.trim()),
      };

      Response response = await post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      debugPrint('Status Code: ${response.statusCode}');
      debugPrint('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);

        if (decodedJson['status'] == 'success') {
          final data = decodedJson['data'];

          if (data['modifiedCount'] > 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product updated successfully'),
                backgroundColor: Color(0xff3f9cc2),
              ),
            );
            widget.refreshProductList();
            // Navigate back
            Navigator.pop(context);
          } else if (data['matchedCount'] > 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No changes were made to the product'),
                backgroundColor: Colors.orange,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Product not found'),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to update product'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error updating product: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      _updateInProgress = false;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _codeTEController.dispose();
    _quantityTEController.dispose();
    _priceTEController.dispose();
    _imageUrlTEController.dispose();
    super.dispose();
  }
}
