import 'package:flutter/material.dart';
import 'package:fundamentals/appbar.dart';
import 'package:fundamentals/data/appstyle.dart';
import 'package:fundamentals/data/userdummydata.dart';

class BottomNavigationCheck extends StatefulWidget {
  const BottomNavigationCheck({super.key});
  _BottomNavigationCheck createState() => _BottomNavigationCheck();
}

class _BottomNavigationCheck extends State<BottomNavigationCheck> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "To Do",
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey, ${Userdummydata.userName}!  ',
                style: AppStyle.PrimaryText,
              ),
              Text(
                Userdummydata.greetingMessage,
                style: AppStyle.secondaryText,
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      true;
                    },
                  ),
                  Text("Go For A Walk"),
                  Expanded(
                    child: Container(width: double.infinity),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete_sharp))
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts_rounded), label: "Profile")
        ])));
  }
}
