import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novalab_test/features/get_news/presentation/news_bloc/news_bloc.dart';
import 'package:novalab_test/injection_container.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News'),),

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
              return ListView.builder(
                  itemCount: state.news.length,
                  itemBuilder: (context, index) {
                    return  ListTile(title: Text(state.news[index].title),);
                  }
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
