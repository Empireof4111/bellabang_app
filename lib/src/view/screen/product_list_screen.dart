// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bella_banga/src/model/vendorModel.dart';
import 'package:bella_banga/src/services/auth_services.dart';
import 'package:bella_banga/src/view/screen/product_by_vendor_screen.dart';
import 'package:bella_banga/src/view/screen/vendor_screen.dart';
import 'package:flutter/material.dart';

import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/core/app_data.dart';
import 'package:bella_banga/src/model/categoryModel.dart';
import 'package:bella_banga/src/model/productModel.dart';
import 'package:bella_banga/src/services/product_services.dart';
import 'package:bella_banga/src/utility.dart';
import 'package:bella_banga/src/view/screen/category_screen.dart';
import 'package:bella_banga/src/view/screen/product_by_category_screen.dart';
import 'package:bella_banga/src/view/screen/product_detail_screen.dart';
import 'package:bella_banga/src/view/widget/product_grid_view.dart';

// final Product product = Product();

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
 List<CategoryModel>? categories;
 List<Product>? product;
List<VendorModel>? vendorList;


  final ProductServices productServices = ProductServices();
  final AuthService authService = AuthService();


  @override
  void initState() {
    super.initState();
    fetchAllProductCategory();
    fetchAllProdut();
    fetchAllVendors();
  }

    void fetchAllProductCategory() async {
    categories = await productServices.fetchAllCategory(context);
    // setState(() {
    // });
  }

  void fetchAllProdut() async {
    product = await productServices.fetchAllUserProducts(context, 0, 20);
    setState(() {
      
    });
  }

    void fetchAllVendors() async {
    vendorList = await authService.fetchAllVendors(context, 0, 20);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColor.darkGrey),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: const EdgeInsets.only(bottom: 14, top: 0),
                  height: 40,
                  width: double.infinity,
                  child: SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      elevation: MaterialStateProperty.all(0),
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Text("Search..."),
                      trailing: const <Widget>[
                        Icon(Icons.search),
                      ],
                    );
                  }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {},
                      );
                    });
                  }),
                
                  //end of search bar
                ),
                _recommendedProductListView(context),
                HeaderTitle(seeAll: "SEE ALL", title: "Shop by vendors", press: (){
                  Navigator.pushNamed(context, VendorScreen.routeName);
                }),
                Container(
  height: 100,
  color: Colors.transparent,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: (vendorList == null) ? 0 : vendorList!.length,
    itemBuilder: (BuildContext ctx, index) {
      return GestureDetector(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColor.lightOrange),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/ShopsVendor.png"),
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(vendorList![index].businessName.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(vendorList![index].businessAddress.toString(), overflow: TextOverflow.ellipsis),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: (){
          Navigator.pushNamed(context, ProductByVendorScreen.routeName, arguments: vendorList![index].id);
        },
      );
    },
  ),
),
                HeaderTitle(seeAll: "SEE ALL", title: "Top categories", press: (){
                  Navigator.pushNamed(context, CategoryScreen.routName);
                }),
                //TOP CATEGORY
                Container(
                  height: 80,
                  color: Colors.transparent,
                 child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (categories == null)? 0 : 4,
                  itemBuilder: (BuildContext ctx, index){
                  return TopCategoryCard( categoryName: categories![index].category!.name.toString(), categoryImage: "$imageUrl${categories![index].category?.imageLink}", press: () { 
                    Navigator.pushNamed(context, ProductByCategoryScreen.routeName, arguments:categories?[index].category!.id);
                   },);
                 }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 1.0,
                                crossAxisSpacing: 2.0,
                                crossAxisCount: 1,
                                childAspectRatio: 1),)
                  ),

                  //POPULAR PRODUCT SECTION 

                const HeaderTitle2(title: "Popular product"),

                 Padding(
                  padding: const EdgeInsets.only(top: 4),
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
                      return ProductGridView(productImgUrl: "$imageUrl${product![index].thumbnail}", productTitle: product![index].name.toString(), productPrice:  product![index].price as double, press: () { 
                        Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: product![index]);
                       }, currencyType: product![index].currencyCode.toString(),);
                      
                    },
                  ),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//seperate function



//App Bar
  PreferredSize get _appBar {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    height: 50,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Bella Banga",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                children: [
             GestureDetector(
              onTap: (){

              },
              child: const Icon(Icons.chat, color: AppColor.darkOrange,),),
             const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                    
                    },
                    child: const Icon(Icons.favorite, color: AppColor.darkOrange,)),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//slider
  Widget _recommendedProductListView(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 0),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: AppData.recommendedProducts.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 320,
                decoration: BoxDecoration(
                  color: AppColor.darkOrange,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome to\n BELLA BANGA',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppData
                                  .recommendedProducts[index]
                                  .buttonBackgroundColor,
                              elevation: 0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              "Get Now",
                              style: TextStyle(
                                color: AppData.recommendedProducts[index]
                                    .buttonTextColor!,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/shopping.png',
                      height: 125,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

class HeaderTitle extends StatelessWidget {
  final String title, seeAll;
  final GestureTapCallback press;
  const HeaderTitle({
    super.key,
    required this.seeAll, required this.title, required this.press
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
         padding: const EdgeInsets.symmetric(vertical: 2),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(
               title,
               style: Theme.of(context).textTheme.headlineMedium,
             ),
             TextButton(
               onPressed: press,
               style: TextButton.styleFrom(foregroundColor: AppColor.darkOrange),
               child: Text(
                 seeAll,
                 style: Theme.of(context)
                     .textTheme
                     .titleLarge
                     ?.copyWith(color: AppColor.darkOrange),
               ),
             )
           ],
         ),
       );
  }
}


class HeaderTitle2 extends StatelessWidget {
  final String title;
  const HeaderTitle2({
    super.key,required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
         padding: const EdgeInsets.symmetric(vertical: 20),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(
               title,
               style: Theme.of(context).textTheme.headlineMedium,
             )
           ],
         ),
       );
  }
}

class TopCategoryCard extends StatelessWidget {
  final String categoryImage;
  final String categoryName;
  final GestureTapCallback press;
  const TopCategoryCard({
    super.key,
    required this.categoryImage,
    required this.categoryName,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            // border: Border.all(color: AppColor.lightGrey, width: 1.0),
            // image: DecorationImage(
            //   image: NetworkImage(categoryImage), scale: 1.0, fit: BoxFit.contain,
            //   ),
            
            ),
            child: Image.network(categoryImage,  fit: BoxFit.fitWidth, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset("assets/images/errorImage.png");
        },),
          ),
          Text(categoryName, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}


