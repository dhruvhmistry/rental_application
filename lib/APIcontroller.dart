import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rental_application/models/categoryModel.dart';

class APIcontroller extends GetxController {
  RxList CatList = [].obs;
  getcat() async {
    var api = "https://rentalhere.in/api/getCategory";
    var response = await http.get(Uri.parse(api));
    var data = jsonDecode(response.body);
    var mydata = data['data']['category'];
    var category = mydata.map((cat) => CategoryModel.fromJson(cat)).toList();
    print(category);
    CatList.clear();
    CatList.addAll(category);
  }
}
