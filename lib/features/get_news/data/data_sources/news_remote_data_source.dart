


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
  Future<List<NewsModel>> getNews() => _getNewsFromUrl('https://jsonplaceholder.typicode.com/comments?postId=1');
// //https://newsdata.io/api/1/news?apikey=pub_21438d2c8a6d9a7e731d80d2e4ae1ad5cd11
  Future<List<NewsModel>> _getNewsFromUrl( url)async{



    final response =  await dio.get(url,);

    if(response.statusCode == 200){
  //    print(response.data["results"]);
      List<NewsModel> news = (response.data as List)
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
