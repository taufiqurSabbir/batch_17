class Urls {
  static String baseURL = "https://crud-api-ostad-live.onrender.com/api/v1";
  static String createProduct = '$baseURL/CreateProduct';
  static String readProduct = '$baseURL/ReadProduct';
  static String deleteProduct(String id) => '$baseURL/DeleteProduct/$id';
}