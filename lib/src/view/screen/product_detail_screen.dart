import 'package:bella_banga/boxes.dart';
import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/core/default_button.dart';
import 'package:bella_banga/src/model/local_storage_model/addtocartmodel.dart';
import 'package:bella_banga/src/model/productModel.dart';
import 'package:bella_banga/src/services/currency_converter_services.dart';
import 'package:bella_banga/core/size_config.dart';
import 'package:bella_banga/src/services/product_services.dart';
import 'package:bella_banga/src/utiliti/utility.dart';
import 'package:bella_banga/src/view/widget/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:bella_banga/src/view/widget/page_wrapper.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen(this.product, {super.key});
  static const String routeName = "/Product-detail";



  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}
final ProductServices productServices = ProductServices();
 List<Product>? productByCategory;

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState(){
    super.initState();
    fetchAllFxRate();
    fetchAllProductCategoryById();
  }

   int page = 0;
 int size = 20;

    void fetchAllProductCategoryById() async {
    productByCategory = await productServices.fetchAllProductsByCategory(context, widget.product.categoryId as int, page = page, size = size);
    setState(() {
      
    });
  }

   Future<void> fetchAllFxRate() async{
    List<Map<String, dynamic>> exchangeRates = await CurrencyConversionApi.getExchangeRates();
    setState((){
    newExchangeRates = exchangeRates;
    });
  }

  List<Map<String, dynamic>> newExchangeRates = [];
  
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
    double? absAmount =  basedCurrencyConvertion(widget.product.currencyCode.toString(), widget.product.price as double, newExchangeRates);
    double? myShippingfee =  basedCurrencyConvertion(widget.product.currencyCode.toString(), widget.product.shippingFees as double, newExchangeRates);
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
                         newExchangeRates.isNotEmpty ? Text( 
                            "${currencySymbolConveeter(currencyChoosed)} ${absAmount?.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.displayLarge,
                          ) : const Text("Loading.."),
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
                         newExchangeRates.isNotEmpty ? Text(
                           "${currencySymbolConveeter(currencyChoosed)}${myShippingfee?.toStringAsFixed(2)}",
                            style: const TextStyle(fontWeight: FontWeight.w500, color: AppColor.lightOrange),
                          ) : const Text("Loading.."),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(widget.product.description.toString(), textAlign: TextAlign.justify,),
                      const SizedBox(height: 30),
                     Text("Related Product", style: Theme.of(context).textTheme.headlineMedium,), 
                     SearchProductCard(productByCategory: productByCategory,)
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
                                cartCurrencyCode: widget.product.currencyCode.toString(), 
                                id: widget.product.id as int,
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




// ignore: must_be_immutable
class SearchProductCard extends StatefulWidget { 
  SearchProductCard({
    super.key,
    required this.productByCategory,
  });

  // final List<Product>? searchProductList;
 List<Product>? productByCategory;

  @override
  State<SearchProductCard> createState() => _SearchProductCardState();
}

class _SearchProductCardState extends State<SearchProductCard> {
  List<Map<String, dynamic>> newExchangeRates = [];

  @override
 void initState() {
    fetchAllFxRate();
    super.initState();
  }

  Future<void> fetchAllFxRate() async{
    List<Map<String, dynamic>> exchangeRates = await CurrencyConversionApi.getExchangeRates();
    setState(() {
    newExchangeRates = exchangeRates;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.productByCategory == null ? const MyProgressor() : GridView.builder(
    itemCount: (widget.productByCategory == null)? 0 : widget.productByCategory!.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 10 / 12,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (_, index) { 
       return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: widget.productByCategory![index]);
          },
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: 250,
                  decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  // border: Border.all(width: 0.5, color: AppColor.lightGrey),
                  boxShadow: [
                  BoxShadow(
                    color: AppColor.lightGrey,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 0.02, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      0.0, // Move to bottom 10 Vertically
                    ),
                  )
                    ],
                ),
                child: Image.network(fit: BoxFit.fill, scale: 1, "$imageUrl${widget.productByCategory![index].thumbnail.toString()}" ),
                 ),
              ),
            Container(
              width: 200,
              height: 50,
                decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: AppColor.lightGrey),
                color: Colors.white,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                boxShadow: const [
                BoxShadow(
                  color: AppColor.lightGrey,
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 0.02, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    0.0, // Move to bottom 10 Vertically
                  ),
                )]
              ),
               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(widget.productByCategory![index].name.toString(), 
                      style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),),
                                    
               Row(
                 children: [
                 newExchangeRates.isNotEmpty ? Text('${currencySymbolConveeter(currencyChoosed)}${basedCurrencyConvertion(widget.productByCategory![index].currencyCode.toString(), widget.productByCategory![index].price as double, newExchangeRates)!.toStringAsFixed(2)}', 
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )) : const Text("Loading.."),
                  const SizedBox(width: 10,),
                   Text('${currencySymbolConveeter(currencyChoosed)}${basedCurrencyConvertion(widget.productByCategory![index].currencyCode.toString(), widget.productByCategory![index].price as double, newExchangeRates)!.toStringAsFixed(2)}',
                   style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                   ),
                 ],
               ),
                   ],
                 ),
               ),
              
              
            ],
          ),
        );
      },
    
    );
  }
}
