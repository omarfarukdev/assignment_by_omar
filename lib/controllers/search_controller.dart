
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  final categories = [
    {'name':'Haire','icon':Icons.face},
    {'name':'Nail','icon':Icons.fingerprint},
    {'name':'Skin','icon':Icons.skip_next},
    {'name':'Eyebrows','icon':Icons.remove_red_eye_outlined},
    {'name':'Massage','icon':Icons.masks_sharp},
    {'name':'Makeup','icon':Icons.coffee_maker},
  ];
  final checkStock =0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkStock.value=1;
  }
}