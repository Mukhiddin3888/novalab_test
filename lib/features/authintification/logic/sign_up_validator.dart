

import 'package:flutter/material.dart';
import 'package:novalab_test/features/authintification/auth.dart';
import 'package:novalab_test/features/authintification/logic/input_validator.dart';
import 'package:novalab_test/features/get_news/presentation/pages/home_screen.dart';

void signUp({ required String email, required String password, context }) {
  if(checkIt(email: email, password: password)){
    AuthenticationHelper()
        .signUp(email: email,
        password: password )
        .then((result) {
      if (result == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text("Invalid input "),
            ));
      }
    });
  }else{
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Invalid input'),
        ));
  }

}