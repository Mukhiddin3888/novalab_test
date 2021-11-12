

import 'package:dartz/dartz.dart';
import 'package:novalab_test/core/errors/exeptions.dart';
import 'package:novalab_test/core/errors/failure.dart';
import 'package:novalab_test/core/network_info/network_info.dart';
import 'package:novalab_test/features/get_news/data/data_sources/news_local_data_cource.dart';
import 'package:novalab_test/features/get_news/data/data_sources/news_remote_data_source.dart';
import 'package:novalab_test/features/get_news/domain/entity/news_entity.dart';
import 'package:novalab_test/features/get_news/domain/repository/news_repository.dart';




class NewsRepositoryImpl implements NewsRepository{

  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl({ required this.remoteDataSource,
    required this.networkInfo, required this.localDataSource});

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    if(await networkInfo.isConnected){

      try{
        final remoteNews = await remoteDataSource.getNews();
        localDataSource.cacheData(remoteNews);
        return Right(remoteNews);

      }on ServerException{
        return Left(ServerFailure());
      }

    }else{
      try{
        final List localData =  localDataSource.getLastNews();
        return Right(localData as List<NewsEntity> );
      } on CacheException{
        return Left(CacheFailure());
      }

    }

  }


}