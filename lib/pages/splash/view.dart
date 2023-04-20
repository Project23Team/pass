import 'package:flutter/material.dart';
import 'package:myapp/pages/login/view.dart';
import 'package:myapp/pages/signup/view.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future Delay() async{
    await Future.delayed(const Duration(seconds: 4));
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Login()));
  }
  @override
  void initState(){
    super.initState();
    Delay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body:Center(child: Image.asset("images/logo.png",width: 250,height: 200,)),

    );
  }
}