import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novalab_test/core/utils/colors/my_colors.dart';
import 'package:novalab_test/core/utils/icons/icons.dart';
import 'package:novalab_test/core/utils/styles/my_styles.dart';
import 'package:novalab_test/features/get_news/presentation/news_bloc/news_bloc.dart';
import 'package:novalab_test/injection_container.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(title: Center(child: Text('News',style: MyTextStyles.openSansNormal,)),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/icons/menu.svg', height: 24,width: 24,),
          ),
        ),
      actions: [SvgPicture.asset('assets/icons/search.svg'), SizedBox(width: 18,)],
      ),

      body: BlocProvider(
        create: (context) => sl<NewsBloc>(),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsInitial) {
              BlocProvider.of<NewsBloc>(context).add(GetNews());
              return Container();
            }
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewsLoaded) {
              return Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/icons/back.svg')),
                  SizedBox(
                    height: height,
                    width: width,
                    child: ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                      return Stack(
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                              color: Colors.yellowAccent,
                            ),
                            margin: EdgeInsets.only(left: 12,right: 12,top: 12),
                            height: 265,
                            width: width,

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12,right: 12,top: 235),
                            child: Container(

                              width: width,
                              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 28),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: MyColors.white
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.news[index].title, style: MyTextStyles.rubikNormal,),
                                  Container(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    child: Text('Category',style: MyTextStyles.rubikNormal.copyWith(color: Colors.grey),),
                                  ),
                                  Text(state.news[index].description,style: MyTextStyles.rubikNormal,
                                    overflow: TextOverflow.fade,
                                  maxLines: 3,
                                  ),
                                  SizedBox(height: 24,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('Details',style: MyTextStyles.rubikNormal.copyWith(color: MyColors.primary),),
                                      SizedBox(width: 8,),
                                      SvgPicture.asset(MyIcons.arrow_right,color: MyColors.primary,height: 24,width: 24,)
                                    ],
                                  )
                                ],
                              ),

                            ),
                          ),
                        ],
                      );
                    },),
                  ),
                ],
              );
            }
            if (state is NewsLoadingError) {
              return Center(child: Text(state.message));
            }
            else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
