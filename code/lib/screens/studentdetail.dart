// ignore_for_file: prefer_const_constructors, constant_identifier_names, unnecessary_this, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:studentdetail/constants/colors.dart';
import 'package:studentdetail/model/todo.dart';
import 'package:studentdetail/screens/addstudent.dart';

final appHeight = 650.0;
final appWidth = 350.0;
final topSectionHeight = 250.0;
final middleSectionHeight = 110.0;

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Memberdetail extends StatefulWidget {
  final Student user;

  const Memberdetail({super.key, required this.user});

  @override
  State<Memberdetail> createState() => _MemberdetailState();
}

class _MemberdetailState extends State<Memberdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'Student Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProfileInfo(
                    widget.user.name,
                    widget.user.mobile,
                  ),
                  Stack(children: <Widget>[
                    Row(children: <Widget>[
                      Container(
                        child: Text(''),
                        width: appWidth / 2,
                        height: middleSectionHeight,
                        decoration: BoxDecoration(),
                      ),
                      Container(
                        child: Text(''),
                        width: appWidth / 2,
                        height: middleSectionHeight,
                        decoration: BoxDecoration(),
                      ),
                    ]),
                    ProfileStats(
                      user: widget.user,
                    ),
                  ]),
                  Container(
                    height: 70.0,
                    child: Stack(
                      children: <Widget>[
                        Container(),
                        /* Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70.0)),
                          ),
                          child: Center(
                            child: Text("User Detail",
                                style: TextStyle(
                                    fontFamily: 'Futura', fontSize: 16.0)),
                          ),
                        ), */
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              sliver: Container(
                child: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400.0,
                    mainAxisSpacing: 30.0,
                    crossAxisSpacing: 30.0,
                    childAspectRatio: 6.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(tdBlue)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddStudent(
                                          isupdate: true,
                                          user: Student(
                                              name: widget.user.name,
                                              regno: widget.user.regno,
                                              clas: widget.user.clas,
                                              mobile: widget.user.mobile,
                                              dept: widget.user.dept),
                                        )));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.06,
                            alignment: Alignment.center,
                            child: Text(
                              "Update",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ),
            ),
            /*  SliverPadding(
              padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              sliver: Container(
                child: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 175.0,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 2.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      List<String> _titles = [
                        "Reg No",
                        "Mobile",
                      ];
                      List<String> _subtitles = [
                        widget.user.regno,
                        widget.user.mobile,
                      ];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        padding: (index % 2 == 0
                            ? EdgeInsets.only(left: 20.0)
                            : EdgeInsets.only(right: 20.0)),
                        child: ImageWidget(
                          title: _titles[index],
                          subtitle: _subtitles[index],
                        ),
                      );
                    },
                    childCount: 2,
                  ),
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String text;
  final String mobile;
  ProfileInfo(
    this.text,
    this.mobile,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: topSectionHeight,
        ),
        Container(
          height: topSectionHeight,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/658291850/photo/young-plant-growing-in-sunlight.jpg?s=612x612&w=0&k=20&c=ZH9gmP8dLhwNaWuVbtBz99Fkybg_B0Uanw88QXSdMnY='),
                  radius: 35.0,
                )),
            Container(
                child: Text(this.text,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Futura'))),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Text(this.mobile,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Futura'))),
          ])),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(70.0))),
        )
      ],
    );
  }
}

class ProfileStats extends StatelessWidget {
  final Student user;

  const ProfileStats({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: middleSectionHeight,
      padding: EdgeInsets.all(16.0),
      // ignore: sort_child_properties_last
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 2.0),
                      child: Text("Register no",
                          style: TextStyle(fontFamily: 'Futura')),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(user.regno,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura')))
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 2.0),
                      child:
                          Text("Class", style: TextStyle(fontFamily: 'Futura')),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(user.clas,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura')))
                  ]),
                  Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 2.0),
                      child: Text("Department",
                          style: TextStyle(fontFamily: 'Futura')),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Text(user.dept,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura')))
                  ]),
                ])
          ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(70.0), topLeft: Radius.circular(70.0)),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const ImageWidget({super.key, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                this.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                this.subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ));
  }
}
