import 'package:sqflite/sqflite.dart';
import 'package:to_do_list_app/models_db/task_db.dart';

class DBHelper {
  static Database ? _db;
  static final int _version=1;
  static final String _tableName='tasks';
  static Future<void> intiDB()async{
    if (_db !=null){
      return ;
    }
    try{
      String _path = await getDatabasesPath() + 'tasks.db';
      _db=await openDatabase(_path,version: _version,onCreate: (db, version) {
        print("creating a new one");
        return db.execute('CREATE TABLE $_tableName("id INTEGER PRIMARY KEY AUTOINCREMENT,""title STRING ,note Text,date String,""remind INTEGER,""color INTEGER,""isCompleted INTEGER,")');
      },
      );
    
    }catch (e){
      print('e');
    }
  }

  static Future <int>insert(TaskDb ? task)async {
    print('insert function called');
    return await _db?.insert(_tableName, task!.toJson() as Map<String, Object?>)??1;
  }
}