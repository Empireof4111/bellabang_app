import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/src/model/categoryModel.dart';
import 'package:bella_banga/src/services/product_services.dart';
import 'package:bella_banga/src/utiliti/utility.dart';
import 'package:bella_banga/src/view/screen/product_by_category_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static const String routName = "/Category-screen";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
List<CategoryModel>? categories;

  final ProductServices productServices = ProductServices();

  @override
  void initState() {
    super.initState();
    fetchAllProductCategory();
  }

    void fetchAllProductCategory() async {
    categories = await productServices.fetchAllCategory(context);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.lightOrange,
        title: const Text( 'Category', style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))
      ),
      body: categories == null ? const Center(child: MyProgressor(),) : Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: (categories == null)? 0 : categories!.length ,
          itemBuilder: (ctx, index){
         return Padding(
           padding: const EdgeInsets.symmetric(vertical: 4),
           child: Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: AppColor.lightGrey),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CategoryCard(
                  cartName: "${categories![index].category!.name}", 
                  cartType: "${categories![index].category!.type}",
                  image: "$imageUrl${categories![index].category!.imageLink}", 
                  press: () { 
                    Navigator.pushNamed(context,  arguments: categories![index].category?.id, ProductByCategoryScreen.routeName);
                   },),
              ),
            ),  
         );
          }
        ),
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  final String image;
  final String cartName;
  final String cartType;
  final GestureTapCallback press;

  const CategoryCard({
    super.key, // Add Key? key here
    required this.cartName,
    required this.cartType,
    required this.image,
    required this.press,
  }); // Pass key to the super constructor



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImage.assetNetwork(placeholder: "assets/images/logo.jpg", image: image,
         imageErrorBuilder: 
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset("assets/images/logo.jpg");
        },
          ),
          // Image.network(image, 
          
          // ),
           Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(cartType),
              ],
            ),
          )
        ],
      ),
    );
  }
}
