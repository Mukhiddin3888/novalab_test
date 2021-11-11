


import 'package:hive/hive.dart';
import 'package:novalab_test/core/errors/exeptions.dart';
import 'package:novalab_test/core/storage/hive.dart';


abstract class NewsLocalDataSource {

  List getLastNews();

  Future<void> cacheData(List dataToCache);

}


class NewsLocalDataSourceImpl implements NewsLocalDataSource{
  @override
  Future<void> cacheData(List dataToCache) {
    return HiveStoreMe.putData(boxName: 'news', keyWord: 'all', data: dataToCache);
  }

  @override
  List getLastNews()  {
    var ldata =  Hive.box('news').get('all') ;

    if(ldata != null){
      return ldata;
    }else{
      throw CacheException();
    }
  }

}