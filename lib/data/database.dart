import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todolist = [];

  final _myBox = Hive.box('mybox');

  //create initial data methoid
  void createInitialData() {
    [
      todolist = ['Make Tutorial', false],
      ['Make Food', true],
    ];
  }

//showcase database
  void loadData() {
    todolist = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", todolist);
  }
}
