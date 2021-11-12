


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novalab_test/core/storage/hive.dart';
import 'package:novalab_test/features/authintification/auth.dart';
import 'package:novalab_test/features/authintification/logic/input_validator.dart';
import 'package:novalab_test/features/get_news/presentation/pages/home_screen.dart';

void login (String email, String password, context){
  if(checkIt(email: email, password:  password)){
    AuthenticationHelper()
        .signIn(email: email,
        password: password)
        .then((result) async {
      if (result == null) {
        await  HiveStoreMe.putToken(boxName: 'user', keyWord: 'user', data: true);
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
