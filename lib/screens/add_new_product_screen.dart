import 'dart:convert';
import 'package:api_test/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key, required this.refreshScreen});
  final VoidCallback refreshScreen;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool _addNewProductInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _imageUrlTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
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
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'e.g. 5347',
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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
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
                    visible: _addNewProductInProgress == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: FilledButton(
                      onPressed: _onTapAddProductButton,
                      child: Text('Add product'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapAddProductButton() async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }
    _addNewProductInProgress = true;
    setState(() {});
    //Prepare Uri to request
    Uri uri = Uri.parse(Urls.createProduct);
    //Prepare Data
    int totalPrice =
        int.parse(_quantityTEController.text) *
        int.parse(_priceTEController.text);
    Map<String, dynamic> requestBody = {
      "ProductName": _nameTEController.text.trim(),
      "ProductCode": int.parse(_codeTEController.text.trim()),
      "Img": _imageUrlTEController.text.trim(),
      "Qty": int.parse(_quantityTEController.text.trim()),
      "UnitPrice": int.parse(_priceTEController.text.trim()),
      "TotalPrice": totalPrice,
    };
    //Request with Data
    Response response = await post(
      uri,
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final decodeJson = jsonDecode(response.body);
      if (decodeJson['status'] == 'success') {
        _clearTextFields();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product added successfully'),
            backgroundColor: Color(0xff3f9cc2),
          ),
        );
        Navigator.pop(context);
        widget.refreshScreen();
      } else {
        String errorMessage = decodeJson["data"];
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    }
    _addNewProductInProgress = false;
    setState(() {});
  }

  void _clearTextFields() {
    _nameTEController.clear();
    _codeTEController.clear();
    _imageUrlTEController.clear();
    _quantityTEController.clear();
    _priceTEController.clear();
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
