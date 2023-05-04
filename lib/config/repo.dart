import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:studentdetail/model/todo.dart';
import 'package:studentdetail/screens/home.dart';

class Repo {
  static var coll;

  static Future start() async {
    // Log into database
    final db = await Db.create(
        "");
    await db.open(); // Initiate the connection
    coll =
        db.collection('details'); // Define a handle to the contacts collection
    inspect(db);
    print(coll);
  }

  static insert({required Student user}) async {
    await coll.insertAll([user.toMap()]);
    await getDocuments();
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      detail.clear();
      final users = await coll.find().toList();
      detail = users;
      return users;
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  static update({required Student user}) async {
    var u = await coll.findOne({"regno": user.regno});
    print("iu" + u.toString());
    u["name"] = user.name;
    u["regno"] = user.regno;
    u["mobile"] = user.mobile;
    u["clas"] = user.clas;
    u["dept"] = user.dept;
    await coll.update(u);
    await getDocuments();
  }

  static delete({required Student user}) async {
    var u = await coll.findOne({"regno": user.regno});
    //print("df" + u.toString());
    coll.remove(where.id(u["_id"]));
    await getDocuments();
  }
}
