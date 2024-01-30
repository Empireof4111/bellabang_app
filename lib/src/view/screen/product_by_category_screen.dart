import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/src/model/productModel.dart';
import 'package:bella_banga/src/services/product_services.dart';
import 'package:bella_banga/src/utiliti/utility.dart';
import 'package:bella_banga/src/view/screen/product_detail_screen.dart';
import 'package:bella_banga/src/view/widget/product_grid_view.dart';
import 'package:flutter/material.dart';

class ProductByCategoryScreen extends StatefulWidget {
  final int categoryId;
  const ProductByCategoryScreen({
    super.key,
    required this.categoryId,
  });
  static const String routeName = '/Product-by-category-screen';

  @override
  State<ProductByCategoryScreen> createState() => _ProductByCategoryScreenState();
}
class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {

   List<Product>? product;
final ProductServices productServices = ProductServices();



  @override
  void initState() {
    super.initState();
    fetchAllProductCategoryById();
  }


 int page = 0;
 int size = 20;

    void fetchAllProductCategoryById() async {
    product = await productServices.fetchAllProductsByCategory(context, widget.categoryId, page = page, size = size);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.lightOrange,
        title: const Text( 'Shop by category', style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))
      ),
      body:  product == null ? const Center(child: MyProgressor(),) :
      Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                  itemCount: (product == null)? 0 : product!.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 10 / 16,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (_, index) {
                      if (product == null) {
            return const Center(child: MyProgressor());
          } else if (product!.isEmpty) {
            return const Center(child: Text('No product found'));
          } else {
                      return ProductGridView(productImgUrl: "$imageUrl${product![index].thumbnail}", productTitle: product![index].name.toString(), productPrice: product![index].price as double, press: () { 
                         Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: product![index]);
                       }, currencyType: product![index].currencyCode.toString(), productId: product![index].id as int,);
                      
                    }}
                  ),
                )
               
    );
  }
}


