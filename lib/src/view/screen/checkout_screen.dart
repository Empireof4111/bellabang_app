// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bella_banga/src/utility.dart';
import 'package:flutter/material.dart';

import 'package:bella_banga/boxes.dart';
import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/core/default_button.dart';
import 'package:bella_banga/src/model/local_storage_model/addtocartmodel.dart';
import 'package:bella_banga/src/view/screen/home_screen.dart';
import 'package:flutterwave_standard/flutterwave.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  static const String routeName = '/Checkout';
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {


  late double totalPrice = 0.0;
  void calculateTotalPrice() {
    double newTotalPrice = 0.0;
    for (int index = 0; index < cartBox.length; index++) {
      Addtocartmodel addtocartmodel = cartBox.getAt(index);
      newTotalPrice += addtocartmodel.productPrice * addtocartmodel.productQuantity;
    }

    setState(() {
      totalPrice = newTotalPrice;
    });
  }

  late double totalShippingFee = 0.0;
  void calculateTotalShippingFee() {
    double newTotalPrice = 0.0;
    for (int index = 0; index < cartBox.length; index++) {
      Addtocartmodel addtocartmodel = cartBox.getAt(index);
      newTotalPrice += addtocartmodel.cartShippingFee;
    }

    setState(() {
      totalShippingFee = newTotalPrice;
    });
  }

   late double totalServiceCharge = 0.0;
  void calculateTotalServcieCharge() {
    double newTotalPrice = 0.0;
    for (int index = 0; index < cartBox.length; index++) {
      Addtocartmodel addtocartmodel = cartBox.getAt(index);
      newTotalPrice += addtocartmodel.cartServiceCharged;
    }

    setState(() {
      totalServiceCharge = newTotalPrice;
    });
  }

    _handlePaymentInitialization( double totalAmount) async {
    final Customer customer = Customer(email: "customer@customer.com");

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-3f74bf90d07b6f3be179d49f5ed7b87e-X",
        currency: "NGN",
        redirectUrl: "www.zomo.com",
        txRef: "payment from Mobile App",
        amount: totalAmount.toString(),
        customer: customer,
        paymentOptions: "card, payattitude, barter, bank transfer, ussd",
        customization: Customization(title: "Test Payment"),
        isTestMode: true);
    final ChargeResponse response = await flutterwave.charge();
    showLoading(response.toString());
    print("${response.toJson()}");
  }


Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }


String getPublicKey() {
    return "";
  }

  
  @override
  Widget build(BuildContext context) {
    calculateTotalPrice();
    calculateTotalShippingFee();
    calculateTotalServcieCharge();
    double totalAmount = (totalPrice + totalShippingFee + totalServiceCharge);

    return Scaffold(
appBar:  AppBar(
        backgroundColor: AppColor.lightOrange,
        title: const Text('Check Out', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    ),
    body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Padding(
               padding: const EdgeInsets.only(left: 20, top: 20),
               child: Row(
                 children: [
                   Text("Order list",  style: Theme.of(context).textTheme.displayMedium,),
                 ],
               ),
             ),
            const SizedBox(
              height: 10,
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: cartBox.length,  itemBuilder: (context, index){
              Addtocartmodel addtocartmodel = cartBox.getAt(index);
                        return   CartCard(
                          cartImage: addtocartmodel.cartImageUrl, 
                          cartProductName: addtocartmodel.productName, 
                          cartProductSize: addtocartmodel.productSize, 
                          cartProductQuantity: addtocartmodel.productQuantity, 
                          cartProductPrice: addtocartmodel.productPrice, 
                          cartColor: addtocartmodel.productColor, shippingFees: addtocartmodel.cartShippingFee);
            }),
             const SizedBox(
              height: 20,
            ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Row(
                 children: [
                   Text("Shipping address",  style: Theme.of(context).textTheme.displayMedium,),
                 ],
               ),
             ),
              const SizedBox(
              height: 20,
            ),

             //Address Card

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.lightGrey,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.lightGrey,
                                  blurRadius: 25.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    0.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.home,
                              color: AppColor.darkOrange,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Delivery Address",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 50),
                          const Text(
                            "Change",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Kano State',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'No. 31 BUK Road Behind Zone One, Police Barrack Kano ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
 

        //End Address
          // Padding(
          //      padding: const EdgeInsets.only(left: 20),
          //      child: Row(
          //        children: [
          //          Text("Promo code",  style: Theme.of(context).textTheme.displayMedium,),
          //        ],
          //      ),
          //    ),
          //     const SizedBox(
          //     height: 20,
          //   ),
          //promo code card
          
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 80,
        //         width: double.infinity,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //           boxShadow: const [
        //             BoxShadow(
        //               color: AppColor.lightGrey,
        //               blurRadius: 25.0, // soften the shadow
        //               spreadRadius: 1.0, //extend the shadow
        //               offset: Offset(
        //                 0.0, // Move to right 10  horizontally
        //                 0.0, // Move to bottom 10 Vertically
        //               ),
        //             )
        //           ],
        //         ),
        //         child: Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Container(
        //                     width: 50,
        //                     height: 50,
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(10),
        //                       color: AppColor.darkOrange,
        //                       boxShadow: const [
        //                         BoxShadow(
        //                           color: AppColor.lightGrey,
        //                           blurRadius: 25.0, // soften the shadow
        //                           spreadRadius: 1.0, //extend the shadow
        //                           offset: Offset(
        //                             0.0, // Move to right 10  horizontally
        //                             0.0, // Move to bottom 10 Vertically
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                     child: const Icon(
        //                       Icons.percent,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                   const Text(
        //                     "Code TRYNEW applied!",
        //                     style: TextStyle(
        //                       fontSize: 16,
        //                     ),
        //                   ),
        //                   const SizedBox(width: 30),
        //                   const Text(
        //                     "Remove",
        //                     style: TextStyle(
        //                       fontSize: 16, color: Colors.red
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
 
          //End promo code card

          const SizedBox(
              height: 20,
            ),
        //End Address
          Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Row(
                 children: [
                   Text("Bill Deatils",  style: Theme.of(context).textTheme.displayMedium,),
                 ],
               ),
             ),
              const SizedBox(
              height: 20,
            ),
          //Bill Details Card
          
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.lightGrey,
                      blurRadius: 25.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        0.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BillDetailsCard(title: 'Total price', price: totalPrice.toString(),),
                      BillDetailsCard(title: 'Shipping fee', price:totalShippingFee.toString(),),
                      BillDetailsCard(title: 'Service Charges', price: totalServiceCharge.toString(),),
                    const Divider(height: 30, thickness: 2,),
                      BillDetailsCard(title: 'Total Amount', price: totalAmount.toString(),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
 

           Padding(
             padding: const EdgeInsets.all(20),
             child: DefaultButton(
                  text: "Continue",
                  press: () {
                    _handlePaymentInitialization(totalAmount);
                  }
              ),
           ),
      
          ],
        ),
      ),
    );
  }
}

class BillDetailsCard extends StatelessWidget {
   const BillDetailsCard({
    super.key,
    required this.title,
    required this.price,
  });

final String title;
final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(title, style: const TextStyle(color: AppColor.darkGrey, fontSize: 18, fontWeight: FontWeight.bold),),
      Text(price, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
    ],);
  }
}


// ignore: must_be_immutable
class CartCard extends StatefulWidget {
   final String cartImage;
  final String cartProductName;
  final String cartProductSize;
  late int cartProductQuantity;
  late double cartProductPrice;
  late double shippingFees;
  final String cartColor;
   CartCard({
    super.key,
    required this.cartImage,
    required this.cartProductName,
    required this.cartProductSize,
    required this.cartProductQuantity,
    required this.cartProductPrice,
    required this.shippingFees,
    required this.cartColor,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {

  late double finalTotal = (widget.cartProductPrice*widget.cartProductQuantity)+(widget.shippingFees);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: AppColor.lightGrey,
              blurRadius: 25.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 90,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Image.network(imageUrl+widget.cartImage, fit: BoxFit.fitHeight,),
              ),
              SizedBox(
                height: 120,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.cartProductName.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                        ),
                        // Icon(
                        //   Icons.delete_outline,
                        //   color: AppColor.darkOrange,
                        // )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Color: ${widget.cartColor} | Size: ${widget.cartProductSize}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                      text:  TextSpan(
                        text: widget.cartProductPrice.toString(),
                        style: const TextStyle(
                                                  fontSize: 18,
                                                  color: AppColor.darkOrange,
                                                  fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(text: " x ${widget.cartProductQuantity.toString()}", style: const TextStyle(color: Colors.red, fontSize: 12,)),
                        ],
                      ),
                    ),
                        
                       Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                finalTotal.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
