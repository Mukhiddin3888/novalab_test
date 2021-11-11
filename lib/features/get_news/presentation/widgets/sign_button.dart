import 'package:flutter/material.dart';
import 'package:novalab_test/core/utils/utils.dart';


class SignInUpButton extends StatelessWidget {
  const SignInUpButton({
    Key? key,
    required this.title
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: MyColors.primary
      ),
      child: Center(child: Text(title,
        style: MyTextStyles.notoSansBold.copyWith(color: MyColors.white, fontSize: 17),)),
    );
  }
}
