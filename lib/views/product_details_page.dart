import 'package:assignment_by_omar/controllers/search_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5E5E5),
        elevation: 0,
        title: const Text(
          "প্রোডাক্ট ডিটেইল",
          style: TextStyle(color: Color(0xff323232),fontSize: 20,fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Color(0xff323232),),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx((){
            if(Get.find<SearchController>().deImage!=''){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: const Offset(0,2)),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "কাঙ্ক্ষিত পণ্যটি খুঁজুন",
                          suffixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      aspectRatio: 3,
                      viewportFraction: 0.7,
                      enlargeFactor: 0.2,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(22))
                        ),
                        child: Image.network(
                          "${Get.find<SearchController>().deImage}",
                          //"https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1383/%E0%A6%B8%E0%A6%9C_4.png",
                          height: 273,
                          width: 154,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text("${Get.find<SearchController>().deProductName}",style: TextStyle(color:Color(0xFF19181B),fontSize: 24,fontWeight: FontWeight.w600),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: const TextSpan(
                              text: "ব্রান্ডঃ ",
                              style: TextStyle(color: Color(0xFF646464)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "প্রিঞ্জেলস",
                                    style: TextStyle(color: Color(0xFF19181B),fontSize: 14,fontWeight: FontWeight.w500))
                              ]
                          )),
                      const SizedBox(width: 15,),
                      RichText(
                          text: const TextSpan(
                              text: "ডিস্ট্রিবিউটরঃ ",
                              style: TextStyle(color: Color(0xFF646464)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " মোঃ মোবারাক হোসেন",
                                    style: TextStyle(color: Color(0xFF19181B),fontSize: 14,fontWeight: FontWeight.w500))
                              ]
                          )),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      //fit: StackFit.expand,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "ক্রয়মূল্যঃ",
                                  style: TextStyle(color: Color(0xFFDA2079),fontSize: 20,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                    "৳ ${Get.find<SearchController>().decurrent_charge}",
                                    style: TextStyle(color: Color(0xFFDA2079),fontSize: 20,fontWeight: FontWeight.w600)
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "বিক্রয়মূল্যঃ",
                                  style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    "৳ ${Get.find<SearchController>().deselling_price}",
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500)
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const DottedLine(
                              dashColor: Colors.grey,
                            ),
                            const SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "লাভঃ",
                                  style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    "৳ ${Get.find<SearchController>().deprofit}",
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500)
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 30,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFCCE4),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xFFFFBFDD),
                                        radius: 20,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.remove,size: 14,),
                                          color: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ).marginOnly(left: 5),
                                    const Text("5 পিস",style: TextStyle(color: Color(0xFFDA2079),fontSize: 14,fontWeight: FontWeight.w500),),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                            colors: [(Color(0xff6210E1)),(Color(0xff1400AE))],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 20,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.add,size: 14,),
                                          color: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ).marginOnly(right: 5),
                                  ],
                                ),
                              ),
                            )
                        ),
                        Positioned.fill(
                            bottom: -55,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: ClipPolygon(
                                      sides: 6,
                                      borderRadius: 10,
                                      boxShadows: [
                                        PolygonBoxShadow(color: Colors.white,elevation: 2.0),
                                      ],
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              colors: [(Color(0xff6210E1)),(Color(0xff1400AE))],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter
                                          ),
                                        ),
                                        child: Text("এটি কিনুন",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),
                                        ).paddingAll(8),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 15,
                                      right: 3,
                                      child:  Container(
                                        width: 20,
                                        height: 20,
                                        child: CircleAvatar(
                                            backgroundColor: Color(0xFFFFCCE4),
                                            radius: 20,
                                            child: Text("5",style: TextStyle(color: Color(0xFFDA2079)),)
                                        ),
                                      ))
                                ],
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Text(
                    "বিস্তারিত",
                    style: TextStyle(color: Color(0xFF323232),fontWeight: FontWeight.w600,fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Html(
                    data:"${Get.find<SearchController>().description}"
                  ),

                  const SizedBox(height: 20,),
                ],
              );
            }
            else{
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: const Offset(0,2)),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "কাঙ্ক্ষিত পণ্যটি খুঁজুন",
                          suffixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      aspectRatio: 3,
                      viewportFraction: 0.7,
                      enlargeFactor: 0.2,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(22))
                        ),
                        child: Image.network(
                          "https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1383/%E0%A6%B8%E0%A6%9C_4.png",
                          height: 273,
                          width: 154,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text("${Get.find<SearchController>().deProductName}",style: TextStyle(color:Color(0xFF19181B),fontSize: 24,fontWeight: FontWeight.w600),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: const TextSpan(
                              text: "ব্রান্ডঃ ",
                              style: TextStyle(color: Color(0xFF646464)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "প্রিঞ্জেলস",
                                    style: TextStyle(color: Color(0xFF19181B),fontSize: 14,fontWeight: FontWeight.w500))
                              ]
                          )),
                      const SizedBox(width: 15,),
                      RichText(
                          text: const TextSpan(
                              text: "ডিস্ট্রিবিউটরঃ ",
                              style: TextStyle(color: Color(0xFF646464)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " মোঃ মোবারাক হোসেন",
                                    style: TextStyle(color: Color(0xFF19181B),fontSize: 14,fontWeight: FontWeight.w500))
                              ]
                          )),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      //fit: StackFit.expand,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "ক্রয়মূল্যঃ",
                                  style: TextStyle(color: Color(0xFFDA2079),fontSize: 20,fontWeight: FontWeight.w600),
                                ),
                                Text(
                                    "৳ ${Get.find<SearchController>().decurrent_charge}",
                                    style: TextStyle(color: Color(0xFFDA2079),fontSize: 20,fontWeight: FontWeight.w600)
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "বিক্রয়মূল্যঃ",
                                  style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    "৳ ${Get.find<SearchController>().deselling_price}",
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500)
                                ),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            const DottedLine(
                              dashColor: Colors.grey,
                            ),
                            const SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "লাভঃ",
                                  style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    "৳ ${Get.find<SearchController>().deprofit}",
                                    style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500)
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 30,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFCCE4),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xFFFFBFDD),
                                        radius: 20,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.remove,size: 14,),
                                          color: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ).marginOnly(left: 5),
                                    const Text("5 পিস",style: TextStyle(color: Color(0xFFDA2079),fontSize: 14,fontWeight: FontWeight.w500),),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                            colors: [(Color(0xff6210E1)),(Color(0xff1400AE))],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 20,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.add,size: 14,),
                                          color: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ).marginOnly(right: 5),
                                  ],
                                ),
                              ),
                            )
                        ),
                        Positioned.fill(
                            bottom: -55,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: ClipPolygon(
                                      sides: 6,
                                      borderRadius: 10,
                                      boxShadows: [
                                        PolygonBoxShadow(color: Colors.white,elevation: 2.0),
                                      ],
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              colors: [(Color(0xff6210E1)),(Color(0xff1400AE))],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter
                                          ),
                                        ),
                                        child: Text("এটি কিনুন",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),
                                        ).paddingAll(8),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 15,
                                      right: 3,
                                      child:  Container(
                                        width: 20,
                                        height: 20,
                                        child: CircleAvatar(
                                            backgroundColor: Color(0xFFFFCCE4),
                                            radius: 20,
                                            child: Text("5",style: TextStyle(color: Color(0xFFDA2079)),)
                                        ),
                                      ))
                                ],
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Text(
                    "বিস্তারিত",
                    style: TextStyle(color: Color(0xFF323232),fontWeight: FontWeight.w600,fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 8,),
                  const Text(
                    "জীবের মধ্যে সবচেয়ে সম্পূর্ণতা মানুষের। কিন্তু সবচেয়ে অসম্পূর্ণ হয়ে সে জন্মগ্রহণ করে। বাঘ ভালুক তার জীবনযাত্রার পনেরো- আনা মূলধন নিয়ে আসে প্রকৃতির মালখানা থেকে। জীবরঙ্গভূমিতে মানুষ এসে দেখা দেয় দুই শূন্য হাতে মুঠো বেঁধে।",
                    style: TextStyle(
                        color: Color(0xFF646464),fontSize: 16,fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20,),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
