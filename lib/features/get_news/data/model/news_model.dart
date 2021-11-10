

import 'package:novalab_test/features/get_news/domain/entity/news_entity.dart';

class NewsModel extends NewsEntity{
  const NewsModel({
    required String title,
    required String description,
    required String imageUrl,
  }) : super(title: title,description: description, imageUrl: imageUrl);


  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
      title: json["title"] ,
      description: json["description"] ,
      imageUrl: json["image_url"] ,
    );
  }
}