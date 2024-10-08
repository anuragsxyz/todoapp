import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todolist = [];

  final _myBox = Hive.box('mybox');

  //create initial data methoid
  // void createInitialData() {
  //   [
  //     todolist = ['Make Tutorial', false],
  //     ['Make Food', true],
  //   ];
  // }

  void createInitialData() {
    todolist = [
      ['Make Tutorial', false],
      ['Make Food', true],
    ];
  }

//showcase database
  // database.dart
  void loadData() {
    var data = _myBox.get("TODOLIST");
    if (data != null) {
      todolist = List<List<dynamic>>.from(data);
    } else {
      todolist = [];
    }
  }

  //update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", todolist);
  }
}
