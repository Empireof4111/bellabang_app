// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bella_banga/core/app_color.dart';

class ProductGridView extends StatelessWidget {
  final String productImgUrl;
  final String productTitle;
  final String currencyType;
  final double productPrice;
  final GestureTapCallback press;
  const ProductGridView({
    super.key,
    required this.productImgUrl,
    required this.productTitle,
    required this.currencyType,
    required this.productPrice,
    required this.press,
  });

  Widget _gridItemHeader() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                color: AppColor.darkOrange,
              ),
              width: 80,
              height: 30,
              alignment: Alignment.center,
              child: const Text(
                "20% OFF",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
         
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: AppColor.lightOrange,
            ),
            onPressed: () => {
              // color: 
            }
          ),
        ],
      ),
    );
  }

  Widget _gridItemBody( String productImgUrl) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E6E8),
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(width: 0.5, color: AppColor.lightGrey),
        boxShadow: const [
            BoxShadow(
              color: AppColor.lightGrey,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.02, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
      ),
      
      clipBehavior: Clip.hardEdge,
      child: Image.network(productImgUrl,  fit: BoxFit.fitHeight,  errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset("assets/images/errorImage.png");
        },),
    );
  }

  Widget _gridItemFooter(BuildContext context, double productPrice, String productTitle) {
    double percentage = 0.2;
    double discountPrice = percentage * productPrice; 
    double actualPrice = productPrice + discountPrice;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),   
               ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              clipBehavior: Clip.hardEdge,
              child: Text(
                productTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                    currencyType.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    )),
              Text(
                    productPrice.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(width: 3),
                Visibility(
                  visible: true,
                  child: Text(
                    actualPrice.toString(),
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: GridTile(
               header: _gridItemHeader(),
               footer: _gridItemFooter(context, productPrice, productTitle),
               child: _gridItemBody(productImgUrl),
             ),
    );
  }
}
