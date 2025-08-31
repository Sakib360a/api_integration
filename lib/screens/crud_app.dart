import 'package:api_test/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF40a1c6), // Background for all AppBars
          iconTheme: IconThemeData(
            color: Colors.white, // Icon color (back arrow, menu, etc.)
          ),
        ),
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),

      home: ProductListScreen(),
    );
  }
}
