import 'package:hive/hive.dart';

class HiveStoreMe{



 static  putData({required String boxName,required String keyWord ,required List data})async{
   await Hive.box(boxName).put(keyWord, data);
  }


}