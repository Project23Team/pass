import 'package:flutter/material.dart';
import 'package:myapp/classes/language_constants.dart';

import '../../../classes/language.dart';
import '../../../main.dart';
class Navalpassport extends StatefulWidget {
  const Navalpassport({Key? key}) : super(key: key);

  @override
  State<Navalpassport> createState() => _NavalpassportState();
}

class _NavalpassportState extends State<Navalpassport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: Text(translation(context).homePage),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            DropdownButton<Language>(
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,left: 10,right: 10,bottom: 40),
                child:
                Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height:49,
                          decoration: BoxDecoration(
                              color: Color(0xff003b57),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              )
                          ),

                        ),
                        Positioned(
                          top: -50,
                          left: 0,
                          right: 0,
                          child:Center(
                            child: Container(
                              width:150, height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(75),
                                  image: DecorationImage(
                                    image: AssetImage("images/logo.png",),
                                    fit: BoxFit.cover,

                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7,
                                        spreadRadius: 10,
                                        offset: Offset(0,7),
                                        color: Colors.black26
                                    )
                                  ],
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height:200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          )
                      ),
                      child:Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(translation(context).fingerprint,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                      )),


                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          )
                      ),
                      child:Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                         Text("")
                          ],
                        ),
                      
                      )),


                    ),
                  ],
                ),

              )
            ],
          ),
        ],
      ),
    ),
    );
  }
}
