import 'package:flutter/material.dart';
import 'package:oda/SecondPage.dart';
import 'package:oda/models/Category.dart';
import 'package:oda/models/ItemCategory.dart';

import 'models/Lokation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> list = [
      Category(name: "Restoran", img: "assets/images/rest.png", itemCategory: [
        ItemCategory(name: "Neo", img: "assets/images/neo.jpg", phone: "123456789", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Shax saray", img: "assets/images/shaxsaray.jpg", phone: "23456789", location: Lokation(lat: "42.452954", long: "59.6109376"), msg: ""),
        ItemCategory(name: "Qiriq qiz", img: "assets/images/qirqqiz.jpg", phone: "3456789", location: Lokation(lat: "42.4603558", long: "59.6094346"), msg: ""),
        ItemCategory(name: "Bakardi", img: "assets/images/bacardi.jpg", phone: "456789", location: Lokation(lat: "42.4607937", long: "59.6192813"), msg: ""),
      ]),
      Category(name: "Kafe", img: "assets/images/cafe.png", itemCategory: [
        ItemCategory(name: "Qaraqalpag'im", img: "assets/images/noimage.jpg", phone: "11111111", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Sevinch", img: "assets/images/noimage.jpg", phone: "222222222", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Sonata", img: "assets/images/noimage.jpg", phone: "3333333", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Halal", img: "assets/images/noimage.jpg", phone: "4444444", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
      ]),
      Category(name: "Zakusochnaya", img: "assets/images/dinner.png", itemCategory: [
        ItemCategory(name: "Natasha", img: "assets/images/noimage.jpg", phone: "5555555", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Kazan", img: "assets/images/noimage.jpg", phone: "66666666", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Nur", img: "assets/images/noimage.jpg", phone: "77777777", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Uglovoy", img: "assets/images/noimage.jpg", phone: "88888888", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
      ]),
      Category(name: "Fast food", img: "assets/images/fast-food.png", itemCategory: [
        ItemCategory(name: "Bistro", img: "assets/images/noimage.jpg", phone: "99999999", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Lavash tsentr", img: "assets/images/noimage.jpg", phone: "2323232323", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Chikin street", img: "assets/images/noimage.jpg", phone: "1212121212", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
        ItemCategory(name: "Palermo", img: "assets/images/noimage.jpg", phone: "323232322", location: Lokation(lat: '42.4600098', long: '59.6084967'), msg: ""),
      ]),
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Text("ODA"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            getCard(list[0],context),
            getCard(list[1],context),
            getCard(list[2],context),
            getCard(list[3],context),
            // InkWell(
            //   onTap: (){
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
            //   },
            //   child: Container(
            //     margin: EdgeInsets.all(8),
            //     child: Card(
            //       color: Colors.white,
            //       child: Container(
            //         margin: EdgeInsets.all(8),
            //         padding: const EdgeInsets.all(8),
            //         // color: Colors.teal[100],
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Image.asset(
            //               "assets/images/res.png",
            //               width: 70,
            //             ),
            //             Text(
            //               "Restoran",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget getCard(Category category, BuildContext context){
  var itemCategory = category.itemCategory;
  return InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage(category: category,)));
    },
    child: Container(
      margin: EdgeInsets.all(8),
      child: Card(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          // color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                width: 70,
                category.img.toString()
              ),
              Text(
                category.name.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
