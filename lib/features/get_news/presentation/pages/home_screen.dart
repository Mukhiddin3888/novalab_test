import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novalab_test/core/utils/colors/my_colors.dart';
import 'package:novalab_test/core/utils/styles/my_styles.dart';
import 'package:novalab_test/features/get_news/presentation/news_bloc/news_bloc.dart';
import 'package:novalab_test/features/get_news/presentation/widgets/news_preview.dart';
import 'package:novalab_test/injection_container.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('News',style: MyTextStyles.openSansNormal.copyWith(color: MyColors.white),),
        leading: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset('assets/icons/menu.svg', height: 24,width: 24,),
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
                  ListView.builder(
                    itemCount: state.news.length,
                    itemBuilder: (context, index) {
                    return Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          decoration:  BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                                image: NetworkImage('http://${state.news[index].imageUrl}')),

                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16)),

                          ),
                          margin: const EdgeInsets.only(left: 12,right: 12,top: 12),
                          height: 265,

                        ),
                        NewsPreView(state: state.news[index],),
                      ],
                    );
                  },),
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

