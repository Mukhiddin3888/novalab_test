import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:novalab_test/injection_container.dart' as di;

import 'features/get_news/domain/entity/news_entity.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await di.init();
  Hive.registerAdapter(NewsEntityAdapter());
  Hive.openBox('news');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      home: Scaffold(body: Container(child: Center(child: Text('jkragbs')),))
    );
  }
}
