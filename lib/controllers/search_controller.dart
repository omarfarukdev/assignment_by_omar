
import 'dart:convert';

import 'package:assignment_by_omar/models/product_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchController extends GetxController{

  final categories = [
    {'name':'Haire','icon':Icons.face},
    {'name':'Nail','icon':Icons.fingerprint},
    {'name':'Skin','icon':Icons.skip_next},
    {'name':'Eyebrows','icon':Icons.remove_red_eye_outlined},
    {'name':'Massage','icon':Icons.masks_sharp},
    {'name':'Makeup','icon':Icons.coffee_maker},
  ];
  RxInt checkStock =0.obs;
  final baseUrl="https://panel.supplyline.network/api/product/search-suggestions/";
  final limit=10;
  int offset=0;
  late TextEditingController productNameController;
  RxList allProduct=[].obs;
  late ScrollController controller;
  bool isFirstLoadRunning = false;
  bool hasNextPage = true;
  bool isLoadMoreRunning = false;
  String nextUrl='';
  RxString deImage=''.obs;
  String deProductName='';
  double decurrent_charge=0;
  double deselling_price=0;
  double deprofit=0;
  String description='';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    productNameController= TextEditingController();
    controller = ScrollController()..addListener(loadMore);
  }
  void searchFirst() async{
    isFirstLoadRunning=true;
    print("object $limit jjj $offset hhh ${productNameController.text.toString()}");
    final response =
    await http.get(Uri.parse("$baseUrl?limit=$limit&offset=$offset&search=${productNameController.text.toString()}"));
    var res =json.decode(response.body);
    print("object ${response.statusCode} ${res['data']['products']}");
    allProduct.value=res['data']['products']['results'];
    nextUrl=res['data']['products']['next'];
    print("object ${allProduct.length} $nextUrl");
    isFirstLoadRunning=false;

  }

  void loadMore() async{
    print("object leloda");
    final response =
        await http.get(Uri.parse("$nextUrl"));
    var res =json.decode(response.body);
    final List fetchedPosts = res['data']['products']['results'];
    if(fetchedPosts.isNotEmpty){
      allProduct.addAll(fetchedPosts);
    }
    print("Text Omar ${allProduct.length}");
  }
  void productDetails(String slug) async{
    final response = await http.get(Uri.parse("https://panel.supplyline.network/api/product-details/$slug"));
    var res =json.decode(response.body);
    deImage.value=res['data']['image'];
    print("object ${deImage.value}");
    decurrent_charge=res['data']['charge']['current_charge'];
    deselling_price=res['data']['charge']['selling_price'];
    deprofit=res['data']['charge']['profit'];
    deProductName=res['data']['product_name'].toString();
    description=res['data']['description'];
    print("call ${res['data']['product_name'].toString()}");
  }
}