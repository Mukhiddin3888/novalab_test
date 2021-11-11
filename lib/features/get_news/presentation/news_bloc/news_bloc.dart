import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:novalab_test/core/errors/failure.dart';
import 'package:novalab_test/core/errors/map_failure_to_message.dart';
import 'package:novalab_test/core/usecase/usecases.dart';
import 'package:novalab_test/features/get_news/domain/entity/news_entity.dart';
import 'package:novalab_test/features/get_news/domain/usecase/news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({ required this.useCase}) : super(NewsInitial()) ;


  final GetNewsUseCase useCase ;

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async*{
    if(event is GetNews) {

      yield NewsLoading();

      final failureOrData = await useCase(NoParams());


      yield* _eitherLoadedOrErrorState(failureOrData);


    }

  }


  Stream<NewsState> _eitherLoadedOrErrorState( Either<Failure,List<NewsEntity>> failureOrData) async*{

    yield failureOrData.fold(
            (failure) => NewsLoadingError(message: mapFailureToMessage(failure)),
            (news) => NewsLoaded(news:news ));
  }


}
