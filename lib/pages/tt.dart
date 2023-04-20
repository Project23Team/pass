import 'package:flutter/material.dart';
import 'package:myapp/pages/registrationDone/view.dart';

import '../classes/language_constants.dart';
class rr extends StatefulWidget {
  const rr({Key? key}) : super(key: key);

  @override
  State<rr> createState() => _rrState();
}

class _rrState extends State<rr> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'E-Mail'),
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (value) {
              //Validator
            },
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]').hasMatch(value)) {
                return 'Enter a valid email!';
              }
              return null;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          ElevatedButton(
            onPressed: () => _submit(),
            child: Text(translation(context).next,style: TextStyle(fontSize: 25,color:  Color(0xff47B5FF),),),
            style: ElevatedButton.styleFrom(
                elevation: 5,
                primary: Color(0xffffffff),
                // padding: EdgeInsets.symmetric(horizontal:200, vertical: 20),
                side: BorderSide(
                  width: 0,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20,)
                )),

          ),

        ],
      ),



    );
  }


}
