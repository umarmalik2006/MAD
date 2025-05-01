import 'package:get/get.dart';
import 'product.dart';

class ProductController extends GetxController {
  var products = <Product>[
    Product(id: 1, name: 'Apple', price: 2.0),
    Product(id: 2, name: 'Banana', price: 1.5),
    Product(id: 3, name: 'Orange', price: 3.0),
  ].obs;
}
