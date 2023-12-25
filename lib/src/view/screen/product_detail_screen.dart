import 'package:bella_banga/boxes.dart';
import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/core/default_button.dart';
import 'package:bella_banga/src/model/local_storage_model/addtocartmodel.dart';
import 'package:bella_banga/src/model/productModel.dart';
import 'package:bella_banga/src/size_config.dart';
import 'package:bella_banga/src/utility.dart';
import 'package:bella_banga/src/view/widget/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bella_banga/src/view/widget/page_wrapper.dart';
import 'package:hive_flutter/hive_flutter.dart';

// final ProductController controller = Get.put(ProductController());

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen(this.product, {super.key});
  static const String routeName = "/Product-detail";

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
//this custom AppBar
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }

//Product image preview sector
  Widget productPageView(double width, double height) {
    return Container(
      height: height * 0.42,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xFFE5E6E8),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: CarouselSlider(items: widget.product.images!.split(',')),
    );
  }

//Rating Bar
  Widget _ratingBar(BuildContext context) {
    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          itemSize: 25,
          initialRating: widget.product.ratings ?? 2,
          direction: Axis.horizontal,
          itemBuilder: (_, __) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (_) {},
        ),
        Text(
          "(4500 Reviews)",
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w300, fontSize: 18),
        )
      ],
    );
  }

//Product Size sector
  Widget productSizesListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // itemCount: controller.sizeType(widget.product).length,
      itemBuilder: (_, index) {
        return InkWell(
          // onTap: () => controller.switchBetweenProductSizes(widget.product, index),
          child: AnimatedContainer(
            margin: const EdgeInsets.only(right: 5, left: 5),
            alignment: Alignment.center,
            // width: controller.isNominal(widget.product) ? 40 : 70,
            decoration: BoxDecoration(
              // color: controller.sizeType(widget.product)[index].isSelected == false
                  // ? Colors.white
                  // : AppColor.lightOrange,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 0.4),
            ),
            duration: const Duration(milliseconds: 300),
            child: const FittedBox(
              child: Text(
                // controller.sizeType(widget.product)[index].numerical,
                '',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },
    );
  }


int productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: PageWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productPageView(width, height),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 10),
                      _ratingBar(context),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text( 
                            "${widget.product.currencyCode} ${widget.product.price}",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(width: 3),
                          Visibility(
                            visible: false,
                            child: Text(
                              "${widget.product.currencyCode}${widget.product.price}",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                           widget.product.shippingFees.toString(),
                            style: const TextStyle(fontWeight: FontWeight.w500, color: AppColor.lightOrange),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(widget.product.description.toString(), textAlign: TextAlign.justify,),
                      const SizedBox(height: 20),
                      const SizedBox(
                        height: 40,
                        // child:
                        //   builder: (_) => productSizesListView(),
                        
                      ),
                      const SizedBox(height: 20),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: DefaultButton(
                      //     text: "Add to cart",
                      //     press: (){},
                      //   )
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 6),
          elevation: 10,
          surfaceTintColor: Colors.white,
          shadowColor: AppColor.lightGrey,
          color: Colors.white,
          height: 60,
          child:  
          SizedBox(
                        width: double.infinity,
                        child: DefaultButton(
                          text: "Add to cart",
                          press: (){
                            cartBox.put(
                              "CartBox_key${widget.product.id}", 
                              Addtocartmodel(
                                productName: widget.product.name.toString(), 
                                productColor: widget.product.colors.toString(), 
                                productSize: widget.product.sizes.toString(), 
                                productQuantity: productQuantity,
                                productPrice: widget.product.price as double,
                                cartImageUrl: widget.product.images!.split(',')[0].toString(), 
                                cartShippingFee: widget.product.shippingFees as double, 
                                cartServiceCharged: widget.product.serviceCharge as double,
                                ));

                                showSnackBar(context, "${widget.product.name} Added to cart");
                          },
                        )
                      )
        ),
      ),
    );
  }
}
