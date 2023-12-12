import 'package:bella_banga/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});
static String routeName = "/Track-Order";
  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    String orderStatus = 'Order Confirm';
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Track Order',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          leading: GestureDetector(
            onTap: () => {
              Navigator.pop(
                context,
              )
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
      ),

      body: 
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
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
                            child:
                                Image.asset("assets/images/beats_studio_3-2.png"),
                          ),
                          SizedBox(
                            height: 120,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'No. One HaedPhone',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('Color: Red | Size: XL'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '500.00',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColor.darkOrange,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () => {},
                                      child: Container(
                                        height: 25,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                        ),
                                        child: Center(
                                          child:  Text(
                                            orderStatus,
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //Stepper
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                children: [
                   SizedBox(
                    height: 90,
                     child: TimelineTile(
                                       isFirst: true,
                                        beforeLineStyle: const LineStyle(color: AppColor.darkOrange),
                                        indicatorStyle: IndicatorStyle(color: AppColor.darkOrange, iconStyle: IconStyle(iconData: Icons.done, color: Colors.white) ),
                                        endChild: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 20),
                                          color: Colors.transparent,
                                          height: 100,
                                          width:  50,
                                          child: const Column(
                                            
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 30,),
                                              Text('Order Confirm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
                                              Text('Order#2345768'),
                                              Text('9:00 PM June, 2023'),
                                            ],
                                          ),
                                        ),
                                     ),
                   ),
                SizedBox(
                  height: 90,
                  child: TimelineTile(
                    isFirst: false,
                    isLast: false,
                    beforeLineStyle: LineStyle( color: orderStatus == 'Order Confirm' ? AppColor.lightGrey : AppColor.darkOrange  ),
                                        indicatorStyle:  IndicatorStyle(color:   orderStatus == 'Order Confirm' ? AppColor.lightGrey : AppColor.darkOrange),
                                        endChild: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 20),
                                          color: Colors.transparent,
                                          height: 100,
                                          width:  50,
                                          child: const Column(
                                            
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 30,),
                                              Text('Order Confirm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
                                              Text('Order#2345768'),
                                              Text('9:00 PM June, 2023'),
                                            ],
                                          ),
                                        ),

                  ),
                ),
                SizedBox(
                  height: 90,
                  child: TimelineTile(
                    isLast: true,
                    beforeLineStyle: LineStyle(color: orderStatus == 'Order Confirm' ? AppColor.lightGrey : AppColor.darkOrange),
                                        indicatorStyle:  IndicatorStyle(color:  orderStatus == 'Order Confirm' ? AppColor.lightGrey : AppColor.darkOrange),
                                        endChild:  Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 20),
                                          color: Colors.transparent,
                                          height: 100,
                                          width:  50,
                                          child: const Column(
                                            
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 30,),
                                              Text('Order Confirm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
                                              Text('Order#2345768'),
                                              Text('9:00 PM June, 2023'),
                                            ],
                                          ),
                                        ),
                  ),
                ),
                ],
               ),
             ),
              const SizedBox(
                height: 20,
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Row(
                   children: [
                     Text("Delivery address",  style: Theme.of(context).textTheme.displayMedium,),
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
              ],
            ),
          ),
          
    );
  }
}