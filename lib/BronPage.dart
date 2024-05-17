import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oda/HomePage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BronPage extends StatefulWidget {
  const BronPage({Key? key}) : super(key: key);

  @override
  State<BronPage> createState() => _BronPageState();
}

class _BronPageState extends State<BronPage> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController saneCon = TextEditingController();
  TextEditingController adamCon = TextEditingController();
  TextEditingController tolemCon = TextEditingController();

  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int adamSani = 0;
    String sane = "0";
    int tolem = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bron"),
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
                child: TextField(
                  controller: dateinput,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Sa'ne" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
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
                          color: Colors.blueGrey,
                          child: Text(
                            "Xizmet tu'ri",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {

                            // showDialog(
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     title: Text("Xabar"),
                            //     content:Text(
                            //       "Adamlar sani : "+ adamCon.value.text +"\n"
                            //           "Sa'ne : " + dateinput.text +"\n"
                            //           "To'lem : "+tolemCon.value.text
                            //     ),
                            //     actions: [
                            //       MaterialButton(
                            //         onPressed: () {
                            //           Navigator.pop(context);
                            //         },
                            //         color: Colors.red,
                            //         child: Text(
                            //           "Biykarlaw",
                            //           style: TextStyle(color: Colors.white),
                            //         ),
                            //       ),
                            //       MaterialButton(
                            //         onPressed: () {
                            //           toast();
                            //           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                            //           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                            //
                            //
                            //
                            //         },
                            //         color: Colors.green,
                            //         child: Text(
                            //           "Bronlaw",
                            //           style: TextStyle(color: Colors.white),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // );
                          }),
                    ),
                  ],
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
                                      "Sa'ne : " + dateinput.text +"\n"
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
