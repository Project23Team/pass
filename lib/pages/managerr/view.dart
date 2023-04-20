import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Managerr extends StatefulWidget {
  const Managerr({Key? key}) : super(key: key);

  @override
  State<Managerr> createState() => _ManagerrState();
}



class _ManagerrState extends State<Managerr> {
  @override
  var litems = [];
  var name=[];
  var phone=[];
  Future getData() async{
    var url=Uri.parse("http://localhost:4000/log");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);

    print(list1);
    //litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)

    setState(() {
      for (int i=0; i<list1.length; i++){
        name.add(list1[i]["u_name"]);
        phone.add(list1[i]["u_phone"]);
      }
    });
    //print(imitems);//to print in my app
    print(list1);//to print my databace in run

  }
  void initState(){
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:2,
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: [
                    /*
          Container(
      height: 100, width:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade100,
        borderRadius: BorderRadius.circular(5),
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.cyan,
                ),
                Text("User name : "),
                Text("name"),
              ],
            ),
          )

          */
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: page(name[index],phone[index]),
                    ),
                  ],
                );
              }
          )

      ),
    );
  }
  Container page(String name,String phone){
    return Container(
      height: 100, width:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade100,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 85,
            backgroundColor: Colors.cyan,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("User name : "),
                    Text(name),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("User Phone : "),
                  Text(phone),


                ],
              ),
            ],
          ),


        ],
      ),


    );
  }
}
