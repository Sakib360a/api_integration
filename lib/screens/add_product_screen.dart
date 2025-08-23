import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Enter product name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
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
                SizedBox(height: 20,),
                TextFormField(
                  controller: _codeTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'e.g. B12F',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
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
                SizedBox(height: 20,),
                TextFormField(
                  controller: _quantityTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'e.g. 10',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
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
                SizedBox(height: 20,),
                TextFormField(
                  controller: _priceTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'e.g. 500',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
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
                SizedBox(height: 20,),
                TextFormField(
                  controller: _imageUrlTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'https://drive.google.com/image',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
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
                SizedBox(height: 30,),
                SizedBox(
                  height: 50,
                    width: double.infinity,
                    child: FilledButton(onPressed: (){}, child: Text('Add product'))),
              ],
            ),
          ),
        ),
      ),
    );
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
