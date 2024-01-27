import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/src/model/orderDetailModel.dart';
import 'package:bella_banga/src/model/orderModel.dart';
import 'package:bella_banga/src/services/order_services.dart';
import 'package:bella_banga/src/utiliti/utility.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackOrderScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final orderId;
  const TrackOrderScreen({super.key, this.orderId});
static const String routeName = "/Track-Order";
  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}
class _TrackOrderScreenState extends State<TrackOrderScreen> {

List<OrderDetailModel>? orderDetailList;
List<OrderModel>? orderByIdList;
final OrderServices orderServices = OrderServices();


@override
void initState() {
    super.initState();
    orderDeatail();
    orderByOrderId();
  }

void orderDeatail()async{
  orderDetailList = await orderServices.orderDetail(context, widget.orderId);
  setState(() {
  });
}


void orderByOrderId()async{
 orderByIdList  = await orderServices.getOrderByOrderId(context, widget.orderId);
  setState(() {
    
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightOrange,
          title: const Text(
            'Track Order',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: GestureDetector(
            onTap: () => {
              Navigator.pop(
                context,
              )
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
      ),

      body: orderByIdList == null ? const Center(child: MyProgressor(),) : SingleChildScrollView(
            child: Column(
              children: [
             orderDetailList == null ?  Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Container(
                       height: 120,
                       decoration: BoxDecoration(
                         color: Colors.grey.withOpacity(0.05),
                         borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                       )),
             ): ListView.builder(
              shrinkWrap: true,
              itemCount: orderDetailList?.isEmpty ?? true ? 0 : orderDetailList!.length, 
              itemBuilder: (BuildContext context, index){
              return   SizedBox(
                height: 120,
                child:  ProductCard(
                  orderStatus: orderDetailList![index].details!.status.toString(), 
                  productName: orderDetailList![index].product!.name.toString(), 
                  productColor: orderDetailList![index].product!.colors.toString(),
                  productSize: orderDetailList![index].product!.sizes.toString(), 
                  productPrice: orderDetailList![index].product!.price as double, 
                  vendorName: orderDetailList![index].product!.vendorName.toString(),
                  productImageUrl: orderDetailList![index].product!.images!.split(',')[0], 
                  ),
              );
             }),
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
                    beforeLineStyle: const LineStyle( color: AppColor.darkOrange  ),
                                        indicatorStyle:  const IndicatorStyle(color: AppColor.darkOrange),
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
                    beforeLineStyle: const LineStyle(color:  AppColor.darkOrange),
                                        indicatorStyle:  const IndicatorStyle(color:  AppColor.darkOrange),
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
                     Text("Order Detail",  style: Theme.of(context).textTheme.displayMedium,),
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
                  height: 320,
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

                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                          children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const Text('Order'),
                              Text('#${orderByIdList?[0].orderReferenceId}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18))
                           , Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Shipping Fee'),
                              Text('${currencySymbolConveeter(orderByIdList![0].currencyCode.toString())} ${orderByIdList?[0].shippingFees}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18))
                            ],
                           ),
                            ],
                           ),
                          ],
                        ),
                        
                        
                        Row(
                          children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Transaction charges'),
                              Text('${currencySymbolConveeter(orderByIdList![0].currencyCode.toString())} ${orderByIdList?[0].totalSystemAmount}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18))
                            
                            ,Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Total Amount'),
                              Text(orderByIdList == null ? "Loading.." : '${currencySymbolConveeter(orderByIdList![0].currencyCode.toString())} ${orderByIdList![0].totalAmount!.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18))
                            ],
                           ),
                            ],
                           ),
                            
                          ],
                        ),
                        
                        ],
                       ),
                        
                        const SizedBox(height: 10,),
                        const Divider(thickness: 1, height: 1, indent: 0, endIndent: 0,),
                         const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Text('Order Status |'),
                            const SizedBox(width: 10,),
                            Text('${orderByIdList?[0].status}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18)),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Divider(thickness: 1, height: 1, indent: 0, endIndent: 0,),
                        const SizedBox(height: 10,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('CUSTOMER DEATAILS', style: TextStyle(fontWeight: FontWeight.bold,)),
                          ],
                        ),
                        const SizedBox(height: 4,),
                        const Text('NAME: '),
                        Text('${orderByIdList?[0].customerName}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14)),
                        const SizedBox(height: 4,),
                        const Text('RECEPIENT NO.: '),
                        Text('${orderByIdList?[0].customerMobileNumber}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14)),
                        const SizedBox(height: 4,),
                        const Text('RECEPIENT ADDRESS: '),
                        Text('${orderByIdList?[0].address}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14)),
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

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final String productImageUrl;
  final String productName;
  final String productColor;
  final String productSize;
  final double productPrice;
  final String orderStatus;
  final String vendorName;
   ProductCard({
    super.key,
    required this.productImageUrl,
   required this.vendorName, 
   required this.orderStatus, 
   required this.productName, 
   required this.productColor, 
   required this.productSize, 
   required this.productPrice,
  });


String orderstatus(String stat){
      late  String myOrderStatus = '';
        if(stat == "CA"){
          myOrderStatus = 'Cancel';
          isCancel = true;
      }else if(stat == 'PP'){
        myOrderStatus = "Pending Payment";
          isCancel = true;
      }else{
        myOrderStatus = "Completed";
      }
      return myOrderStatus;
      }
    bool isCancel = false;
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
                child:
                    Image.network("$imageUrl$productImageUrl", fit: BoxFit.fitHeight,),
              ),
              const SizedBox(width: 4,),
              SizedBox(
                height: 120,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productName,
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Color: $productColor '),
                         Text('Size: $productSize'),
                        // const Text('Qtr: XL'),
                    Text(
                      productPrice.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    
                    
                    GestureDetector(
                      onTap: () => {},
                      child: Container(
                        height: 20,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: AppColor.lightOrange,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topLeft: Radius.circular(5),),
                        ),
                        child: Center(
                          child:  Text(
                            // orderStatus,
                            orderstatus(orderStatus),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  
                      ],
                    ),  
                  ],
                ),
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text('Vendor', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                  Text(vendorName, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColor.darkOrange),),
                    ],
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                      color: AppColor.lightOrange,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Icon(Icons.chat, color: Colors.white,),
                  ),
                 
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}