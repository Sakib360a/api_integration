class Urls{
   static const String _apiBaseUrl = 'http://35.73.30.144:2008/api/v1';

   static const String createProduct = '$_apiBaseUrl/CreateProduct';
   static const String getProducts = '$_apiBaseUrl/ReadProduct';
   static String updateProductUrls(String id) => '$_apiBaseUrl/UpdateProduct/$id';
   static String deleteProductUrls(String id) => '$_apiBaseUrl/DeleteProduct/$id';
}