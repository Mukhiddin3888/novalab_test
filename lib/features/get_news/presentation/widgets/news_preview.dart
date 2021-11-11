import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:novalab_test/core/utils/utils.dart';
import 'package:novalab_test/features/get_news/presentation/pages/news_full_screen.dart';

class NewsPreView extends StatelessWidget {
  const NewsPreView({
    Key? key,
    required this.state,
  }) : super(key: key);


  final state;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,top: 235),
      child: Container(


        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 28),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyColors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(state.title, style: MyTextStyles.rubikNormal.copyWith(fontSize: 16),),
            Container(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Text('Category',style: MyTextStyles.rubikNormal.copyWith(color: Colors.grey),),
            ),
            Text(state.description,style: MyTextStyles.rubikNormal,
              overflow: TextOverflow.fade,
              maxLines: 3,
            ),
            SizedBox(height: 24,),
            GestureDetector(
              onTap:(){
                Navigator.push(context,
                    CupertinoPageRoute(builder:(context) => NewsFullScreen(news: state,),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Details',style: MyTextStyles.rubikNormal.copyWith(color: MyColors.primary),),
                  SizedBox(width: 8,),
                  SvgPicture.asset(MyIcons.arrow_right,color: MyColors.primary,height: 24,width: 24,)
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
