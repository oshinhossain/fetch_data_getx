import 'package:fetch_api_getx/product_model.dart';
import 'package:get/get.dart';

import 'http_product.dart';

class AppController extends GetxController {
  var getproduct = ProductModel().obs;
  List<ProductModel?> productModel = [];
  Service service = Service();
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    // isloading = true;
    var data = await service.getProductData();
    productModel = data!.toList();
    // isloading = true;
  }
}
