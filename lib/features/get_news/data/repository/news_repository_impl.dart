

import 'package:dartz/dartz.dart';
import 'package:novalab_test/core/errors/exeptions.dart';
import 'package:novalab_test/core/errors/failure.dart';
import 'package:novalab_test/core/network_info/network_info.dart';
import 'package:novalab_test/features/get_news/data/data_sources/news_remote_data_source.dart';
import 'package:novalab_test/features/get_news/domain/entity/news_entity.dart';
import 'package:novalab_test/features/get_news/domain/repository/news_repository.dart';




class NewsRepositoryImpl implements NewsRepository{

  final NewsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl({ required this.remoteDataSource,
    required this.networkInfo,});

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    if(await networkInfo.isConnected){

      try{
        final remoteNews = await remoteDataSource.getNews();
       // localDataSource.cachePosts(remoteAlbums, userId);
        return Right(remoteNews);

      }on ServerException{
        return Left(ServerFailure());
      }

    }else{
    /*  try{
      //  final List localData =  localDataSource.getLastAlbums(userId);
      //  return Right(localData  as List<AlbumsEntity>);
      } on CacheException{
        return Left(CacheFailure());
      }*/
      return Left(CacheFailure());
    }

  }


}