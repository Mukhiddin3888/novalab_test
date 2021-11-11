



import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'news_entity.g.dart';

@HiveType(typeId: 0)
class NewsEntity extends Equatable{

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String imageUrl;

  const NewsEntity({ required this.title ,required this.description, required this.imageUrl});



  @override
  List<Object> get props => [title, description, imageUrl];
}
