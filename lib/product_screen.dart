import 'package:fetch_api_getx/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductData extends StatefulWidget {
  const ProductData({Key? key}) : super(key: key);

  @override
  _ProductDataState createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  var controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
  }
  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("edjewj")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StaggeredGridView.countBuilder(
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.productModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      var id = controller.productModel[index]!.id;
                      var price = controller.productModel[index]!.price;

                      showModalBottomSheet(
                          useRootNavigator: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) => Container(
                                height: 500,
                                // child: ProductDetailScreen(
                                //   productId: id.toString(),
                                //   // productPrice: price.toDouble(),
                                //   productName:
                                //       controller.productModel[index]!.title,
                                //   products_details:
                                //       controller.productModel[index]!.description,
                                //   productsImage:
                                //       controller.productModel[index]!.image,
                                // )
                              ));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) =>
                      //             ProductsDetails(
                      //               productPrice: productProvider
                      //                       .data_list[index]
                      //                   ['price'],
                      //               productName: productProvider
                      //                       .data_list[index]
                      //                   ['title'],
                      //               products_details:
                      //                   productProvider
                      //                           .data_list[index]
                      //                       ['description'],
                      //               productsImage: productProvider
                      //                       .data_list[index]
                      //                   ['image'],
                      //             ))));
                    },
                    child: Container(
                      child: Card(
                          child: Column(
                        children: [
                          Expanded(
                            child: Container(
                                child: Image.network(controller
                                    .productModel[index]!.image
                                    .toString())),
                          ),
                          Text(
                            controller.productModel[index]!.title.toString(),
                            maxLines: 1,
                            style: TextStyle(),
                          ),
                          Text(
                            'Price ${controller.productModel[index]!.price.toString()}',
                            style: TextStyle(),
                          )
                        ],
                      )),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
