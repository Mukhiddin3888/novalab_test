


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novalab_test/features/authintification/auth.dart';
import 'package:novalab_test/features/authintification/logic/input_validator.dart';
import 'package:novalab_test/features/get_news/presentation/pages/home_screen.dart';

void login (String email, String password, context){
  if(checkIt(email: email, password:  password)){
    AuthenticationHelper()
        .signIn(email: email,
        password: password)
        .then((result) {
      if (result == null) {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Invalid Username or Password'),
            ));                          }
    });
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Invalid input "),
        ));
  }
}
