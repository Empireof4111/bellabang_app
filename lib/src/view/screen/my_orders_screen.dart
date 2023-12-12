import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/core/default_button.dart';
import 'package:bella_banga/src/view/screen/track_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});
  static String routeName = "/My-Order";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: 
        AppBar(
          title: Text(
            'My Orders',
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
          bottom: const TabBar(
              indicatorColor: AppColor.darkOrange,
              indicatorWeight: 4,
              tabs: [
                Tab(
                  child: Text(
                    'On Going',
                    style: TextStyle(
                        color: AppColor.darkOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Completed',
                    style: TextStyle(
                        color: AppColor.darkOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          
          
          Column(
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
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: AppColor.darkOrange,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child:Center(
                                        child: GestureDetector(
                                          onTap: (){
                                              Navigator.pushNamed(context, TrackOrderScreen.routeName);
                                          },
                                          child: const Text(
                                            'Track order',
                                            style: TextStyle(color: Colors.white),
                                          ),
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
              )
            ],
          ),
          
          
          Column(
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
                                  //bottom sheet
                                  GestureDetector(
                                    onTap: () => {
                                      showModalBottomSheet(context: context, builder: (BuildContext context){
                                        return    SizedBox(
                                          height: 700,
                                          width: double.infinity,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                           const Divider(thickness: 6, indent: 140, endIndent: 140, color: AppColor.darkGrey,),
                                           const Text("Leave a review", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                                           const Divider(thickness: 2, color: AppColor.darkGrey,),
                                          const ReviewProductCard(), 
                                           const Divider(thickness: 2, color: AppColor.darkGrey, indent: 28, endIndent: 28,),
                                           const SizedBox(height: 10,),
                                           const Text("How is your order", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                                           const SizedBox(height: 10,),
                                           _ratingBar(context),
                                           const SizedBox(height: 10,),
                                           const Padding(
                                             padding: EdgeInsets.symmetric(horizontal: 20),
                                             child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                               children: [
                                                 Text("Write a review", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),
                                               ],
                                             ),
                                           ),
                                           const SizedBox(height: 10,),
                                          Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 20),
                                            child: Column(
                                            
                                              children: [
                                                const TextField(
                                                        decoration: InputDecoration(
                                                          
                                                          border: OutlineInputBorder(),
                                                          hintText: 'What did you like or dislike',
                                                        ),
                                                      ),
                                                      const SizedBox(height: 10,),
                                            
                                                  DefaultButton(
                                                    text: "Submit",
                                                    press: (){
                                            
                                                    },
                                                  )
                                              ],
                                            ),
                                          ),
                                           
                                            ],
                                          )
                                        );
                                      })
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: AppColor.darkOrange,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Leave Review',
                                          style: TextStyle(color: Colors.white),
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
              )
            ],
          ),
        ]),
      ),
    );
  }
}



  Widget _ratingBar(BuildContext context) {
    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          itemSize: 25,
          initialRating: 4,
          direction: Axis.horizontal,
          itemBuilder: (_, __) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (_) {},
        ),
        
        // Text(
        //   "(4500 Reviews)",
        //   style: Theme.of(context)
        //       .textTheme
        //       .displaySmall
        //       ?.copyWith(fontWeight: FontWeight.w300, fontSize: 18),
        // )
      
      ],
    );
  }

class ReviewProductCard extends StatelessWidget {
  const ReviewProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            const SizedBox(
                              height: 120,
                              width: 200,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'No. One HaedPhone',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                      ),
                                      Text('Color: Red | Size: XL'),
                                    ],
                                  ),
                                

    //                               Row(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   const Text(
    //                                     '500.00',
    //                                     style: TextStyle(
    //                                         fontSize: 18,
    //                                         color: AppColor.darkOrange,
    //                                         fontWeight: FontWeight.bold),
    //                                   ),
    //                                   GestureDetector(
    //                                     onTap: () => {},
    //                                     child: Container(
    //                                       height: 25,
    //                                       width: 80,
    //                                       decoration: BoxDecoration(
    //                                         color: AppColor.darkOrange,
    //                                         borderRadius: BorderRadius.circular(20),
    //                                       ),
    //                                       child:Center(
    //                                         child: GestureDetector(
    // onTap: (){
    //     Navigator.pushNamed(context, TrackOrderScreen.routeName);
    // },
    // child: const Text(
    //   'Track order',
    //   style: TextStyle(color: Colors.white),
    // ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   )
    //                                 ],
    //                               )
                                
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

