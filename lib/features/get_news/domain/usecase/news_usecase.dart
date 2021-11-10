


import 'package:dartz/dartz.dart';
import 'package:novalab_test/core/errors/failure.dart';
import 'package:novalab_test/core/usecase/usecases.dart';
import 'package:novalab_test/features/get_news/domain/entity/news_entity.dart';
import 'package:novalab_test/features/get_news/domain/repository/news_repository.dart';

class GetNewsUseCase implements UseCase<List<NewsEntity>, Params>{

  final NewsRepository repository;

  GetNewsUseCase({ required this.repository});

  @override
  Future<Either<Failure, List<NewsEntity>>> call(NoParams) async {

    return await repository.getNews();

  }
}