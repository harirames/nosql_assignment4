// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:studentdetail/config/repo.dart';
import 'package:studentdetail/constants/colors.dart';
import 'package:studentdetail/model/todo.dart';
import 'package:studentdetail/screens/home.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key, required this.isupdate, required this.user});
  final bool isupdate;
  final Student user;

  @override
  State<AddStudent> createState() => _AddStudent();
}

class _AddStudent extends State<AddStudent> {
  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  List<String> placeholder = [
    "Name",
    "Register Number",
    "Class",
    "Mobile",
    "Department",
  ];
  List validate = [
    false,
    false,
    false,
    false,
    false,
  ];
  // ignore: prefer_final_fields
  List<TextEditingController> _controllers =
      List.generate(5, ((index) => TextEditingController()));
  @override
  void initState() {
    if (widget.isupdate) {
      _controllers[0].text = widget.user.name;
      _controllers[1].text = widget.user.regno;
      _controllers[2].text = widget.user.clas;
      _controllers[3].text = widget.user.mobile;
      _controllers[4].text = widget.user.dept;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Add Student",
          style: TextStyle(
            color: tdBlue,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      inputFile(
                          label: placeholder[0],
                          controllers: _controllers[0],
                          validate: validate[0],
                          valcan: "Value can't be null"),
                      inputFile(
                          label: placeholder[1],
                          controllers: _controllers[1],
                          validate: validate[1],
                          valcan: "Value can't be null"),
                      inputFile(
                          label: placeholder[2],
                          controllers: _controllers[2],
                          validate: validate[2],
                          valcan: "Value can't be null"),
                      inputFile(
                          label: placeholder[3],
                          controllers: _controllers[3],
                          validate: validate[3],
                          valcan: "Value can't be null"),
                      inputFile(
                          label: placeholder[4],
                          controllers: _controllers[4],
                          validate: validate[4],
                          valcan: "Value can't be null"),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _controllers[0].text.isEmpty
                                ? validate[0] = true
                                : validate[0] = false;
                            _controllers[1].text.isEmpty
                                ? validate[1] = true
                                : validate[1] = false;
                            _controllers[2].text.isEmpty
                                ? validate[2] = true
                                : validate[2] = false;
                            _controllers[3].text.isEmpty
                                ? validate[3] = true
                                : validate[3] = false;
                            _controllers[4].text.isEmpty
                                ? validate[4] = true
                                : validate[4] = false;
                          });
                          if (!validate[0] &&
                              !validate[1] &&
                              !validate[2] &&
                              !validate[3] &&
                              !validate[4]) {
                            widget.isupdate
                                ? (Repo.update(
                                    user: Student(
                                        name: _controllers[0].text,
                                        regno: _controllers[1].text,
                                        clas: _controllers[2].text,
                                        mobile: _controllers[3].text,
                                        dept: _controllers[4].text)))
                                : (Repo.insert(
                                    user: Student(
                                        name: _controllers[0].text,
                                        regno: _controllers[1].text,
                                        clas: _controllers[2].text,
                                        mobile: _controllers[3].text,
                                        dept: _controllers[4].text)));
                            _controllers.forEach((element) {
                              element.clear();
                            });
                            widget.isupdate
                                ? showSnackBarText("Student Updated")
                                : showSnackBarText("Student Added");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                                (route) => false);
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            backgroundColor: MaterialStatePropertyAll(tdBlue)),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: Text(
                            widget.isupdate ? "Update" : "Add",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ])),
          )),
    );
  }
}

Widget inputFile({label, controllers, validate, valcan}) {
  return TextFormField(
    cursorColor: tdBlue,
    controller: controllers,
    decoration: InputDecoration(
      label: Text(label),
      labelStyle: TextStyle(color: tdBlue),
      errorText: validate ? valcan : null,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: tdBlue),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: tdBlue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
