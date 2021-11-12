import 'package:hive/hive.dart';

class HiveStoreMe{



 static  putData({required String boxName,required String keyWord ,required List data})async{
   await Hive.box<List>(boxName).put(keyWord, data);
  }

 static  putToken({required String boxName,required String keyWord ,required bool data})async{
   await Hive.box<bool>(boxName).put(keyWord, data);
  }


}