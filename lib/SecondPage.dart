import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:oda/VariantOrder.dart';
import 'package:oda/models/Category.dart';
import 'package:oda/models/ItemCategory.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:maps_launcher/maps_launcher.dart';


class SecondPage extends StatelessWidget {
  Category category;

  SecondPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name.toString()),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: category.itemCategory?.length,
            itemBuilder: (context, index) {
              String p = category.itemCategory?[index].phone;
              return Container(
                height: 70,
                child: InkWell(
                  onTap: (){
                    print("Card basildi");
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VariantOrder()));

                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                category.itemCategory![index].img,
                                // "assets/images/res.png",
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  category.itemCategory?[index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: InkWell(
                                  onTap: () async {
                                    print("phone basildi");

                                    FlutterPhoneDirectCaller.callNumber(category.itemCategory![index].phone);

                                    // UrlLauncher.launch("tel://21213123123");
                                    // launch("tel://21213123123");
                                    // launch("tel:$p");
                                    // Uri phoneno = Uri.parse('tel:+2238061');
                                    // if (await launchUrl(phoneno)) {
                                    // //dialer opened
                                    // }else{
                                    // //dailer is not opened
                                    // }
                                  },
                                  child: Image.asset("assets/images/phone.png",
                                    height: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  print("Location basildi");
                                  MapsLauncher.launchCoordinates(
                                      category.itemCategory![index].location.lat, category.itemCategory![index].location.long, 'Google address');
                                },
                                child: Image.asset(
                                  "assets/images/loc.png",
                                  height: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
