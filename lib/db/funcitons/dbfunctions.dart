
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/studentmodel.dart';

ValueNotifier <List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final id = await studentDB.add(value);
  final data = await studentDB.get(id);
  await studentDB.put(id,
      StudentModel(
          name: data!.name,
          age: data.age,
          department: data.department,
          profilePhoto: data.profilePhoto,
          location: data.location,
          guardian: data.guardian,
          id: id,
      ),
  );
  value.id = id;
  studentListNotifier.value.add(value);
  print(id);
  studentListNotifier.notifyListeners();
}


Future<void> getAllStudents() async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.delete(id);
  getAllStudents();
}

// Future<void> notifyListeners() async{
//   studentListNotifier.notifyListeners();
//
// }