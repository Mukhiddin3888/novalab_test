


import 'package:dio/dio.dart';
import 'package:novalab_test/core/errors/exeptions.dart';
import 'package:novalab_test/features/get_news/data/model/news_model.dart';



abstract class NewsRemoteDataSource{


  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{


  Dio dio = Dio();

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NewsModel>> getNews() => _getNewsFromUrl('https://pakhtakor.000webhostapp.com/api/posts');

  Future<List<NewsModel>> _getNewsFromUrl( url)async{



    final response =  await dio.get(url,);

    if(response.statusCode == 200){
  //    print(response.data["results"]);
      List<NewsModel> news = (response.data["data"] as List)
          .map(
            (e) => NewsModel.fromJson(e as Map<String, dynamic>),
      )
          .toList();
      return news ;
    }else{
      throw ServerException();
    }

  }



}
