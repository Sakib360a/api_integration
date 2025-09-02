import 'dart:convert';
import 'package:api_test/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Test extends StatefulWidget {
  const Test({super.key, required this.refreshScreen});
  final VoidCallback refreshScreen;

  @override
  State<Test> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<Test> {
  bool _addNewProductInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _imageUrlTEController = TextEditingController();

  // Helper method to build consistent TextFormField with no error spacing
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required TextInputType keyboardType,
    TextInputAction? textInputAction,
  }) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType,
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return ''; // Return empty string to trigger error border without text
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xffc1d4ef).withOpacity(0.3),
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
        // Error border for validation
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xFF40a1c6)),
        // KEY FIX: Remove error text spacing
        errorStyle: TextStyle(height: 0, fontSize: 0),
        helperText: ' ', // Maintains consistent spacing
        helperStyle: TextStyle(height: 0.01),
      ),
      style: TextStyle(color: Colors.black87, fontSize: 16.0),
      cursorColor: Color(0xFF40a1c6),
    );
  }

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
                _buildTextFormField(
                  controller: _nameTEController,
                  labelText: 'Product Name',
                  hintText: 'Enter product name',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                _buildTextFormField(
                  controller: _codeTEController,
                  labelText: 'Product Code',
                  hintText: 'e.g. 5347',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                _buildTextFormField(
                  controller: _quantityTEController,
                  labelText: 'Quantity',
                  hintText: 'e.g. 10',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                _buildTextFormField(
                  controller: _priceTEController,
                  labelText: 'Unit Price',
                  hintText: 'e.g. 500',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                _buildTextFormField(
                  controller: _imageUrlTEController,
                  labelText: 'Image Url',
                  hintText: 'https://drive.google.com/image',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
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
      // Show a SnackBar with validation error since we removed error text
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    _addNewProductInProgress = true;
    setState(() {});

    try {
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add product. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please check your input.'),
          backgroundColor: Colors.red,
        ),
      );
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