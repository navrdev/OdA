import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'HomePage.dart';


class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {

  TextEditingController adamCon = TextEditingController();
  TextEditingController tolemCon = TextEditingController();


  @override
  Widget build(BuildContext context) {
    int adamSani = 0;
    // String sane = "0";
    int tolem = 0;
    String? product = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Dostavka"),
      ),
      body: Container(
        margin: EdgeInsets.all(2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: adamCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adam sani',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  hint: const Text("Productlar"),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['Palaw', 'Pelmen', 'Manti', 'Sorpa'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    // print(val);
                    product = val;
                    // toast();

                  },
                  // isExpanded: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onTap: (){
                    setState(() {
                      tolem = tolemCon.value.text as int;
                    });
                  },
                  controller: tolemCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "To'lem",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                          height: 50,
                          splashColor: Colors.red,
                          color: Colors.blue,
                          child: Text(
                            "Bron",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Xabar"),
                                content:Text(
                                    "Adamlar sani : "+ adamCon.value.text +"\n"
                                        "Awqatlar : " + product! +"\n"
                                        "To'lem : "+tolemCon.value.text
                                ),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.red,
                                    child: Text(
                                      "Biykarlaw",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      toast();
                                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);

                                    },
                                    color: Colors.green,
                                    child: Text(
                                      "Bronlaw",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void toast(){
  Fluttertoast.showToast(
      msg: "Zakaz alindi!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


