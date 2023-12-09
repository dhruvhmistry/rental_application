import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rental_application/models/categoryModel.dart';

class APIcontroller extends GetxController {
  RxList CatList = [].obs;
  RxList ProList = [].obs;

  // getcatagory() async {
  //   var myres =
  //       await http.get(Uri.parse("https://rentalhere.in/api/getCategory"));
  // }

  getcat() async {
    try {
      var response = await http.get(Uri.parse("https://dummyjson.com/carts"));
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var mydata = data['data']['category'];
        var category =
            mydata.map((cat) => CategoryModel.fromJson(cat)).toList();
        print(category);
        CatList.clear();
        CatList.addAll(category);
        print(CatList);
      } else {
        print("error to get category");
      }
    } catch (e) {
      print(e);
    }
  }

  getpro() async {
    var api = "https://rentalhere.in/api/get_product";
    var response = await http.get(Uri.parse(api));
    var data = jsonDecode(response.body);
    var mydata = data['data']['product'];
    var pro = mydata.map((pr) => CategoryModel.fromJson(pr)).toList();
    print(pro);
    ProList.clear();
    ProList.addAll(pro);
  }
}
