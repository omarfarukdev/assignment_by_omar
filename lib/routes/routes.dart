
import 'package:assignment_by_omar/views/product_details_page.dart';
import 'package:assignment_by_omar/views/search_page.dart';
import 'package:get/get.dart';

class Routes{
  static const String search= "/search";
  static const String details= "/details";

  static List<GetPage> routes=[
    GetPage(name: Routes.search, page:()=> SearchPage()),
    GetPage(name: Routes.details, page: ()=>ProductDetailsPage())
  ];

}