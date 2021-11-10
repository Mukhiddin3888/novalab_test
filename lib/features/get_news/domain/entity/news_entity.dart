



import 'package:equatable/equatable.dart';


class NewsEntity extends Equatable{

  final String title;
  final String description;
  final String imageUrl;

  const NewsEntity({ required this.title ,required this.description, required this.imageUrl});



  @override
  List<Object> get props => [title, description, imageUrl];
}
