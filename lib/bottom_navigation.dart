import 'package:flutter/material.dart';
import 'package:fundamentals/data/appstyle.dart';
import 'package:fundamentals/data/database.dart';
import 'package:fundamentals/data/userdummydata.dart';
import 'package:fundamentals/widgets/dialogbox.dart';

import 'package:fundamentals/widgets/todo_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BottomNavigationCheck extends StatefulWidget {
  const BottomNavigationCheck({super.key});

  @override
  _BottomNavigationCheck createState() => _BottomNavigationCheck();
}

class _BottomNavigationCheck extends State<BottomNavigationCheck> {
  final _myBox = Hive.box('mybox');

//Text controller
  final _controller = TextEditingController();
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    //if this is the first time opening the app create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there already exist the data
      db.loadData();
    }
    super.initState();
  }

  // List todolist = [
  //   ['Go Shopiing', true],
  //   ['Go Shopiing', false],
  // ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todolist.add(
        [_controller.text, false],
      );
      _controller.clear();
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialogCheckbox(
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
          controller: _controller,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "To Do",
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          shape: const CircleBorder(),
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hey, ${Userdummydata.userName}!  ',
                style: AppStyle.PrimaryText,
              ),
              const Text(
                Userdummydata.greetingMessage,
                style: AppStyle.secondaryText,
              ),
              // SizedBox(
              //   height: 21,
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: db.todolist.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                        taskName: db.todolist[index][0],
                        taskCompleted: db.todolist[index][0],
                        deleteFunction: (value) => deleteTask(index),
                        onChanged: (value) => checkboxChanged(value, index));
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts_rounded), label: "Profile")
        ])));
  }
}
