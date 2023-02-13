
import 'package:assignment_by_omar/controllers/search_controller.dart';
import 'package:assignment_by_omar/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final searchController=Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  const Color(0xFFE5E5E5),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
          child: Column(
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
                const SizedBox(height: 10,),
                GridView.count(
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  addAutomaticKeepAlives: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 28,
                  childAspectRatio: 0.75,
                  primary: false,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 6,
                  children: searchController.categories.map((element) =>
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.details);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: const Offset(0,2)),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:  [
                                   Image.network(
                                     "https://d1ojphegpburrh.cloudfront.net/media/images/product/None/1383/%E0%A6%B8%E0%A6%9C_4.png",
                                     height: 120,
                                     width: 100,
                                   ),
                                    const Text(
                                      "Lays Classic Family Chips",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text("ক্রয়",style: TextStyle(color: Color(0xff646464),fontWeight: FontWeight.w400,fontSize: 10),),
                                            const Text("৳ 20.00",style: TextStyle(color: Color(0xffDA2079),fontSize: 16,fontWeight: FontWeight.w700),).marginOnly(left: 3),
                                          ],
                                        ),
                                        const Text("৳ 22.00",style: TextStyle(color: Color(0xFFDA2079),fontSize: 12,decoration: TextDecoration.lineThrough),),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text("বিক্রয়",style: TextStyle(color: Color(0xFF646464),fontSize: 10,fontWeight: FontWeight.w400),),
                                            const Text("৳ 25.00",style: TextStyle(color: Color(0xFF646464),fontWeight: FontWeight.w600,fontSize: 14),).marginOnly(left: 3),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("লাভ",style: TextStyle(color: Color(0xFF646464),fontSize: 10,fontWeight: FontWeight.w400),),
                                            const Text("৳ 5.00",style: TextStyle(color: Color(0xFF646464),fontWeight: FontWeight.w600,fontSize: 15),).marginOnly(left: 3),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() {
                                if(searchController.checkStock.value==0){
                                  return Positioned(
                                      right: 5,
                                      top: 5,
                                      child: Container(
                                        //color: Colors.orangeAccent,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffFFCCCC),
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: const Text("স্টকে নেই").paddingOnly(left: 8,right: 8,top: 2,bottom: 2),
                                      )
                                  );
                                }
                                else{
                                  return Positioned(
                                    bottom: -18,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                        width: 36,
                                        height: 36,
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
                                    ),
                                  );
                                  /*return  Positioned(
                                      bottom: -15,
                                      right: 8,
                                      left: 8,
                                      child: Container(
                                        height: 30,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.blue,
                                                radius: 20,
                                                child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  icon: const Icon(Icons.remove,size: 14,),
                                                  color: Colors.white,
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ).marginOnly(left: 5),
                                            const Text("data"),
                                            SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.blue,
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
                                      )
                                  );*/
                                }
                              }),
                              /*Positioned(
                                  right: 5,
                                  top: 5,
                                  child: Container(
                                    //color: Colors.orangeAccent,
                                    decoration: const BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: const Text("data").paddingOnly(left: 8,right: 8,top: 2,bottom: 2),
                                  )
                              ),*/

                            ],
                          ),
                        ),
                      )).toList(),
                ),
                const SizedBox(height: 20,),
              ],
            ),
        ),
      ) ,
    );
  }
}
