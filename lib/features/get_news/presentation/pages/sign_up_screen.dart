import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:novalab_test/core/utils/utils.dart';
import 'package:novalab_test/features/get_news/presentation/pages/home_screen.dart';
import 'package:novalab_test/features/get_news/presentation/widgets/sign_button.dart';

import '../../../../auth.dart';


class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);


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
                const Text('Sign up',style: MyTextStyles.notoSansBold,),

                const Spacer(),

               TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: MyTextStyles.notoSansNormal.copyWith(color: MyColors.grey)
                  ),),
                 TextField(
                   controller: emailController,
                  onSubmitted: (value){},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                      hintStyle: MyTextStyles.notoSansNormal.copyWith(color: MyColors.grey)
                  ),),
                 TextField(
                   controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                      hintStyle: MyTextStyles.notoSansNormal.copyWith(color: MyColors.grey)

                  ),),

                const Spacer(),

                GestureDetector(
                    onTap:(){
                      AuthenticationHelper()
                          .signUp(email: emailController.text.toString(),
                          password: passwordController.text.toString())
                          .then((result) {
                        if (result == null) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => HomeScreen()));
                        } else {
                         print(result);
                        }
                      });
                    },
                    child: const SignInUpButton(title: 'Sign Up',)),

                const SizedBox(height: 24,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an Account? ", style: MyTextStyles.notoSansNormal),
                    Text('Sign In', style: MyTextStyles.notoSansBold.copyWith(color: MyColors.primary, fontSize: 15),),

                  ],
                ),
                const SizedBox(height: 36,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
