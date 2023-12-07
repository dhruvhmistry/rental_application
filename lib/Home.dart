import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_application/APIcontroller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final catcontroller = Get.put(APIcontroller());
    catcontroller.getcat();
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "RENTAL",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/ppic.png")),
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: BoxDecoration(
                color: Color(0x30CCCCCC),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                      ),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.search_outlined),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catcontroller.CatList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 110,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                              color: Color(0xFFDF453E),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  child: Image.network(
                                    "http://rentalhere.in/public/uploads/" +
                                        catcontroller.CatList[index].iconImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(
                                "${catcontroller.CatList[index].name}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
