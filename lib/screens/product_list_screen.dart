import 'dart:convert';
import 'package:api_test/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../utils/urls.dart';
import '../widgets/product_item.dart';
import 'add_new_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<ProductModel> _productList = [];
  bool _getProductInProgress = false;
  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  Future<void> _getProductList() async {
    setState(() {
      _getProductInProgress = true;
    });
    _productList.clear();
    Uri url = Uri.parse(Urls.getProducts);
    Response response = await get(url);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);

      for (Map<String, dynamic> productJson in decodedJson['data']) {
        ProductModel productModel = ProductModel.fromJson(productJson);
        _productList.add(productModel);
      }
    }
    setState(() {
      _getProductInProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _getProductList();
            },
            icon: Icon(Icons.refresh_rounded, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: Visibility(
        visible: _getProductInProgress == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.separated(
          itemCount: _productList.length,
          itemBuilder: (context, index) => ProductName(
            product: _productList[index],
            refreshProductList: () {
              _getProductList();
            },
          ),
          separatorBuilder: (context, index) => Divider(indent: 70),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 110,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductScreen(
                  refreshScreen: () {
                    setState(() {
                      _getProductList();
                    });
                  },
                ),
              ),
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
