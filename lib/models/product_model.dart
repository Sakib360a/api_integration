// "_id": "68b48c3edd287e3f18a278b8",
// "ProductName": "rtx",
// "ProductCode": 465,
// "Img": "fhfh",
// "Qty": 20,
// "UnitPrice": 2,
// "TotalPrice": 40

class ProductModel {
  late String id;
  late String name;
  late int code;
  late String img;
  late int qty;
  late int price;
  late int total;
  ProductModel.fromJson(Map<String, dynamic> productJson) {
    id = productJson['_id'];
    name = productJson['ProductName'];
    code = productJson['ProductCode'];
    img = productJson['Img'];
    qty = productJson['Qty'];
    price = productJson['UnitPrice'];
    total = productJson['TotalPrice'];
  }
}
