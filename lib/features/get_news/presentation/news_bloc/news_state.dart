part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {

}
 class NewsLoading extends NewsState{}
 class NewsLoaded extends NewsState{

  final List<NewsEntity> news;

  const NewsLoaded({required this.news});

  @override
  List<Object> get props => [news];

 }
 class NewsLoadingError extends NewsState{

  final String message;

  const NewsLoadingError({required this.message});

  @override
  List<Object> get props => [message];
 }