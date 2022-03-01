import 'package:dio/dio.dart';
import 'package:test_app/models/product_model.dart';

class ProductRepository {
  Future<List<Product>> getAll() async {
    var url = "https://balta-eshop.azurewebsites.net/v1/products";
    Response response = await Dio().get(url);
    //final list = Product.fromMap(response.data);
    return (response.data as List).map((p) => Product.fromMap(p)).toList();
 
  }
}
