import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp/dataa.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';
import '../home/view.dart';
var c_nameController = TextEditingController();
var c_phoneController = TextEditingController();
var c_commController = TextEditingController();

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  Future Add_data() async {
    var url = Uri.parse("http://localhost:4000/comment");
    
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"name": "$name",'
        ' "phone": "$phone",'
        ' "comm": "$comm"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var data = jsonDecode(body1);
    print(data);
    var res = data["code"];

    if (res == null) {}
    
  }
    final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: GestureDetector(
          child: Text(
            translation(context).homePage,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
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
          itemBuilder: (BuildContext context, int i) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("POST COMMENT",
                    style: TextStyle(color: Color(0xff47B5FF), fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 80, left: 10, right: 10, bottom: 150),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 650, //or MediaQuery.of(context).size.width+300
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            )),
                        child: Form(
                          key: _key,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int i) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        controller: c_nameController,
                                        validator: (c_nameController) {
                                          if (c_nameController != null &&
                                              c_nameController.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText: translation(context).name,
                                          hintText:
                                              translation(context).nameHint,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                   
                                        Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                               keyboardType: TextInputType.number,
                                        controller: c_phoneController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).phoneNumber,
                                          hintText:
                                              translation(context).phoneNumber,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Container(
                                            margin: EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 50,right: 50,top: 12,bottom: 12),
                                        child: TextFormField(
                                           maxLines: 10,
                                          controller: c_commController,
                                          validator: (val) {
                                            if (val != null && val.isEmpty) {
                                              return translation(context)
                                                  .requiredField;
                                            }
                                            return null;
                                          },
                                          
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                                //borderRadius: BorderRadius.all(
                                             // Radius.circular(30),
                                            
                                           //)
                                            ),
                                            labelText:
                                                translation(context).address,
                                            hintText:
                                                translation(context).address,
                                            //suffixStyle: TextStyle(fontSize: 40)
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                       ],
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(left: 50,right: 50,top: 12,bottom: 12),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Home();
                                          }));
                                          setState(() {
                                            name = c_nameController.text;

                                            phone= c_phoneController.text;
                                            comm = c_commController.text;
                                            //    phone=c_phoneController.text;
                                           
                                            //place=placeOforder;
                                            
                                            Add_data();
                                          });
                                        },
                                        child: Text("post it !",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            elevation: 3,
                                            primary: Color(0xff47B5FF),
                                            // padding: EdgeInsets.symmetric(horizontal:200, vertical: 20),
                                            side: BorderSide(
                                              width: 0,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                              20,
                                            ))),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                      Positioned(
                        top: -80,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 80,
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
                ),
              ],
            );
          }),
    );
  }
}
