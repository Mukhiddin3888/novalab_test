


import 'package:dartz/dartz.dart';
import 'package:novalab_test/core/errors/failure.dart';
import 'package:novalab_test/features/get_news/domain/entity/news_entity.dart';


abstract class NewsRepository{

  Future<Either<Failure, List<NewsEntity>>> getNews();

}
