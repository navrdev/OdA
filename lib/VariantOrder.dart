import 'package:flutter/material.dart';
import 'package:oda/BronPage.dart';
import 'package:oda/DeliveryPage.dart';
import 'package:oda/models/Variant.dart';

class VariantOrder extends StatelessWidget {
  const VariantOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Variant> variants = [
      Variant(img: "assets/images/zal.jpg", name: "Obshiy zal"),
      Variant(img: "assets/images/banketzal.jpg", name: "Banketniy zal"),
      Variant(img: "assets/images/kabina.jpg", name: "Kabina"),
      Variant(img: "assets/images/delivery.jpg", name: "Dostavka"),
    ];
    // List images = [
    //   "assets/images/zal.jpg",
    //   "assets/images/banketzal.jpg",
    //   "assets/images/kabina.jpg",
    //   "assets/images/delivery.jpg",
    // ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Zakaz variant"),
      ),
      body:Container(
        margin: EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            getCard(variants[0],context, 0),
            getCard(variants[1],context,1),
            getCard(variants[2],context,2),
            getCard(variants[3],context,3),
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

Widget getCard(Variant variant, BuildContext context,int index){

  return InkWell(
    onTap: (){
      if(index != 3) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BronPage()));
      }else{
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DeliveryPage()));
      }
    },
    child: Container(
      margin: EdgeInsets.all(8),
      child: Card(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(8),
          // padding: const EdgeInsets.all(8),
          // color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                height: 100,
                // width: ,
                fit: BoxFit.cover,
                // category.img.toString(),
                variant.img,
              ),
              Text(
                // "category",
                variant.name,
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


