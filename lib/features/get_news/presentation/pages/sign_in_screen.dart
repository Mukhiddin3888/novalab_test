import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novalab_test/core/utils/utils.dart';
import 'package:novalab_test/features/get_news/presentation/widgets/sign_button.dart';


class SigInScreen extends StatelessWidget {
  const SigInScreen({Key? key}) : super(key: key);

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

                const TextField(
                  decoration: InputDecoration(
                  hintText: 'Email',
                ),),
                const TextField(
                  decoration: InputDecoration(
                  hintText: 'Password',
                ),),

                const Spacer(),

                const SignInUpButton(title: 'Sign In',),

                const Padding(
                  padding: EdgeInsets.only(top: 22,bottom: 6),
                  child: Text("Don't have an Account", style: MyTextStyles.notoSansNormal),
                ),
                Text('Sign Up', style: MyTextStyles.notoSansBold.copyWith(color: MyColors.primary, fontSize: 15),),
                const SizedBox(height: 36,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

