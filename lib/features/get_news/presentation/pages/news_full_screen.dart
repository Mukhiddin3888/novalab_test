import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novalab_test/core/utils/styles/my_styles.dart';
import 'package:novalab_test/core/utils/utils.dart';
import 'package:novalab_test/features/get_news/domain/entity/news_entity.dart';

class NewsFullScreen extends StatelessWidget {
  const NewsFullScreen({Key? key, required this.news}) : super(key: key);
  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(MyIcons.arrow_left),),
        ),
        elevation: 0,
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: const Text('Details',style: MyTextStyles.rubikNormal,),
      actions: [SvgPicture.asset(MyIcons.share), SizedBox(width: 18,)],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('http://${news.imageUrl}'))
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(news.title,style: MyTextStyles.rubikNormal.copyWith(fontSize: 16),),
            ),
            Text('Category',style: MyTextStyles.rubikNormal.copyWith(color: MyColors.grey),),
            const SizedBox(height: 24,),
            Text(news.description,style: MyTextStyles.rubikNormal.copyWith(color: MyColors.grey),),
          ],
        ),
      ),
    );
  }
}
