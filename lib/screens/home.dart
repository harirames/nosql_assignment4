// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:studentdetail/config/repo.dart';
import 'package:studentdetail/model/todo.dart';
import 'package:studentdetail/screens/addstudent.dart';

import '../constants/colors.dart';
import '../widgets/todo_item.dart';

List<Map<String, dynamic>> detail = [];

bool isloading = true;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _todoController = TextEditingController();
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    await Repo.start();
    await Repo.getDocuments();
    isloading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Student Details',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                    itemCount: detail.length,
                    itemBuilder: (context, index) {
                      var todo = detail[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddStudent(
                                          isupdate: true,
                                          user: Student(
                                              name: todo["name"],
                                              regno: todo["regno"],
                                              clas: todo["clas"],
                                              mobile: todo["mobile"],
                                              dept: todo["dept"]),
                                        )));
                            // print('Clicked on Todo Item.');
                            //onToDoChanged(todo);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          tileColor: Colors.white,
                          title: Text(
                            todo["name"] ?? "name",
                            style: TextStyle(
                              fontSize: 16,
                              color: tdBlack,
                            ),
                          ),
                          trailing: Container(
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.symmetric(vertical: 12),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: tdRed,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: IconButton(
                              color: Colors.white,
                              iconSize: 18,
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                Repo.delete(
                                    user: Student(
                                        name: todo["name"],
                                        regno: todo["regno"],
                                        clas: todo["clas"],
                                        mobile: todo["mobile"],
                                        dept: todo["dept"]));
                                detail.remove(todo);
                                setState(() {});
                                // print('Clicked on delete icon');
                                //onDeleteItem(todo.id);
                              },
                            ),
                          ),
                        ),
                      );
                      ;
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 20,
          right: 20,
        ),
        child: ElevatedButton(
          child: Text(
            '+',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddStudent(
                          isupdate: false,
                          user: Student(
                              name: "",
                              regno: "",
                              clas: "",
                              mobile: "",
                              dept: ""),
                        )));
            setState(() {});
            //_addToDoItem(_todoController.text);
          },
          style: ElevatedButton.styleFrom(
            primary: tdBlue,
            minimumSize: Size(60, 60),
            elevation: 10,
          ),
        ),
      ),
    );
  }

/*   void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  } */
}
