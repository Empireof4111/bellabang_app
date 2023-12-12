// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bella_banga/src/view/screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/core/app_data.dart';
import 'package:bella_banga/src/model/categoryModel.dart';
import 'package:bella_banga/src/provider/user_provider.dart';
import 'package:bella_banga/src/services/product_services.dart';
import 'package:bella_banga/src/utility.dart';
import 'package:bella_banga/src/view/widget/product_grid_view.dart';

// final Product product = Product();

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
      // print((categories![0].category!.name));
      // print((categories!.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: _appBar,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                
                    //end of search ba
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
                // ignore: avoid_print
                Text(
                  user.name!,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "Lets gets somethings?",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                _recommendedProductListView(context),
                HeaderTitle(seeAll: "SEE ALL", title: "Top categories", press: (){
                  Navigator.pushNamed(context, CategoryScreen.routName);
                }),
                //TOP CATEGORY
                Container(
                  height: 60,
                  color: Colors.transparent,
                 child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:categories!.length,
                  itemBuilder: (BuildContext ctx, index){
                  return TopCategoryCard(categoryImage: "$imageUrl${categories![index].category?.imageLink}", press: () {  },);
                 }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 2.0,
                                crossAxisCount: 1,
                                childAspectRatio: 1),)
                  ),
                  const HeaderTitle2(title: "Popular product"),
               const ProductGridView(),
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                    child: const Icon(Icons.favorite)),

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
          padding: const EdgeInsets.symmetric(vertical: 10),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: AppData.recommendedProducts.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 315,
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
  final GestureTapCallback press;
  const TopCategoryCard({
    super.key,
    required this.categoryImage,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.lightOrange, width: 1.0),
        image: DecorationImage(
          image: NetworkImage(categoryImage), scale: 1.0, fit: BoxFit.contain,
          ),
        ),
        // child:  Image.network(categoryImage,  scale: 1.0, fit: BoxFit.contain,),
      ),
    );
  }
}


