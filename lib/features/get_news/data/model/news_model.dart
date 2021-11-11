

import 'package:novalab_test/features/get_news/domain/entity/news_entity.dart';

class NewsModel extends NewsEntity{
  const NewsModel({
    required String title,
    required String description,
    required String imageUrl,
  }) : super(title: title,description: description, imageUrl: imageUrl);


  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
      title: json["name"] ,
      description: json["body"] ,
      imageUrl: json["email"] ,
    );
  }
}