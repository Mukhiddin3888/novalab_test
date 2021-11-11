import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novalab_test/core/utils/utils.dart';
import 'package:novalab_test/features/get_news/presentation/pages/home_screen.dart';
import 'package:novalab_test/features/get_news/presentation/pages/sign_up_screen.dart';
import 'package:novalab_test/features/get_news/presentation/widgets/sign_button.dart';

import '../../../../auth.dart';


class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Spacer(),
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(MyIcons.logo)),
                const SizedBox(height: 16,),
                const Text('Sign in',style: MyTextStyles.notoSansBold,),


                const Spacer(),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                  hintText: 'Email',
                ),),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                  hintText: 'Password',
                ),),

                const Spacer(),

                GestureDetector(
                    onTap: (){
                      AuthenticationHelper()
                          .signIn(email: emailController.text.toString(),
                          password: passwordController.text.toString())
                          .then((result) {
                        if (result == null) {
                          Navigator.pushReplacement(context,
                              CupertinoPageRoute(builder: (context) => HomeScreen()));
                        } else {
                          print(result);
                        }
                      });
                    },
                    child: const SignInUpButton(title: 'Sign In',)),

                const Padding(
                  padding: EdgeInsets.only(top: 22,bottom: 6),
                  child: Text("Don't have an Account", style: MyTextStyles.notoSansNormal),
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) {
                        return  SignUpScreen();
                      },));
                    },
                    child: Text('Sign Up', style: MyTextStyles.notoSansBold.copyWith(color: MyColors.primary, fontSize: 15),)),
                const SizedBox(height: 36,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

