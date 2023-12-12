import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/core/default_button.dart';
import 'package:bella_banga/src/view/screen/home_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  static String routeName = '/Checkout';
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:  AppBar(
  title: Text('Checkout',  style: Theme.of(context).textTheme.displayLarge,),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    ),
    body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Row(
                 children: [
                   Text("Order list",  style: Theme.of(context).textTheme.displayMedium,),
                 ],
               ),
             ),
            const SizedBox(
              height: 20,
            ),
            const CartCard(),
            const CartCard(),
            const CartCard(),
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
 
 const SizedBox(
              height: 20,
            ),
        //End Address
          Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Row(
                 children: [
                   Text("Promo code",  style: Theme.of(context).textTheme.displayMedium,),
                 ],
               ),
             ),
              const SizedBox(
              height: 20,
            ),
          //promo code card
          
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 80,
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.darkOrange,
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
                              Icons.percent,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Code TRYNEW applied!",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 30),
                          const Text(
                            "Remove",
                            style: TextStyle(
                              fontSize: 16, color: Colors.red
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
 
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
                child:  const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BillDetailsCard(title: 'Total price', price: "2000",),
                      BillDetailsCard(title: 'Shipping charges', price: "-20",),
                      BillDetailsCard(title: 'Discount', price: "-20",),
                     Divider(height: 30, thickness: 2,),
                      BillDetailsCard(title: 'Total Amount', price: "2,5000",),
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
                   Navigator.pushNamed(context, HomeScreen.routeName);
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


class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
  });

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
                decoration: const BoxDecoration(
                  color: AppColor.lightGrey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Image.asset("assets/images/beats_studio_3-2.png"),
              ),
              SizedBox(
                height: 120,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No. One HaedPhone',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                        ),
                        Icon(
                          Icons.delete_outline,
                          color: AppColor.darkOrange,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text('Color: Red | Size: XL'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '500.00',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColor.darkOrange,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              splashRadius: 10.0,
                              onPressed: () {},
                              icon: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: AppColor.lightGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Icon(
                                  Icons.remove,
                                  color: AppColor.darkOrange,
                                  size: 20,
                                ),
                              ),
                            ),
                            const Text(
                              '2',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              splashRadius: 10.0,
                              onPressed: () {},
                              icon: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: AppColor.lightGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: const Icon(
                                  Icons.add,
                                  color: AppColor.darkOrange,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
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
