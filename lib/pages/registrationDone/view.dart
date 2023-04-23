import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp/const/api.dart';
import 'package:myapp/dataa.dart';
import 'package:myapp/pages/comment/view.dart';
import 'package:myapp/pages/home/view.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';

class RegistrationDone extends StatefulWidget {
  final String status;
  final String u_phone;
  RegistrationDone({
    required this.status,
   required this.u_phone,
  });

  @override
  State<RegistrationDone> createState() => _RegistrationDoneState();
}

class _RegistrationDoneState extends State<RegistrationDone> {
  late final TextEditingController c_phoneController;
  var litems = [];
  var status = [];
  var name = [];
  var u_phone = [];
  Future getData() async {
    var url = Uri.parse("http://localhost:4000/qr");
    Response response = await get(url);

    String body = response.body;

    List<dynamic> list1 = json.decode(body);

    print(list1);
    //litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)

    setState(() {
      for (int i = 0; i < list1.length; i++) {
        u_phone.add(list1[i]["u_phone"]);
        status.add(list1[i]["status"]);
      }
    });
    //print(imitems);//to print in my app
    print(list1); //to print my databace in run
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: GestureDetector(
          child: Text(translation(context).homePage),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home(u_name: nameup,u_password: passwordup,u_phone: phone,)));
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff003b57),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 80, left: 10, right: 10, bottom: 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 140,
                            ),
                            Text(
                              translation(context).successfullyRegistered,
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff003b57)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.check_circle_outline,
                              color: Color(0xff166d42),
                              size: 40,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                translation(context).fingerprint,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff003b57)),
                              ),
                            ),
                            Center(
                              child: QrImage(
                                //data:status[index] +"   "+u_phone[index],
                                data: "phone is :"+phone,

                                size: 280,
                                // You can include embeddedImageStyle Property if you
                                //wanna embed an image from your Asset folder
                                embeddedImageStyle: QrEmbeddedImageStyle(
                                  size: const Size(
                                    100,
                                    100,
                                  ),
                                ),
                              ),
                            ),
                             Padding(
                               padding: const EdgeInsets.all(1),
                               child: CupertinoAlertDialog(
                                    title: Text("Success"),
                                             actions: [
                                              CupertinoDialogAction(onPressed: (){
                                                Navigator.pop(context);
                                        }, child:  Text("Back"),
                                                  ),
                                      CupertinoDialogAction(onPressed: (){
                                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Comment()));
                                     }, child:  Text("let a comment"),
                                     ),
                                          ],
                               content: Text("Saved successfully"),
                          ),
                             )
                          ],
                        ),
                      ),
                      Positioned(
                        top: -50,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(75),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "images/logo.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7,
                                      spreadRadius: 10,
                                      offset: Offset(0, 7),
                                      color: Colors.black26)
                                ],
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
