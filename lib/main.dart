import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:novalab_test/features/authintification/presentation/sign_in_screen.dart';
import 'package:novalab_test/injection_container.dart' as di;
import 'features/get_news/domain/entity/news_entity.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Hive..registerAdapter(NewsEntityAdapter());
  await Hive.openBox<List>('news');
  await Hive.openBox<bool>('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SignInScreen()
    );
  }
}
