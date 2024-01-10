import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ociuz/model/regmodel/reg_model.dart';

class Regcontroller {
  List<Regmodel> myList = [];

  final db = Hive.box('localDb');
  void Savedata(Regmodel data) {
    myList.add(data);

    updateDb();
  }

  void Deletename(int index) {
    myList.removeAt(index);
    updateDb();
  }

  loadDb() async {
    final List dbData = db.get('NoteList');
    myList = dbData
        .map((e) => Regmodel(
            name: e.name,
            email: e.email,
            mobile: e.mobile,
            designation: e.designation))
        .toList();
    print(myList);
  }

  void updateDb() {
    db.put('NoteList', myList);
  }

  // void editdata(index, Regmodel value) {
  //   myList.where((element) => element == index);
  // }
}
