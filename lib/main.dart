import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:student_app/db/model/studentmodel.dart';
import 'package:student_app/screens/screen_home.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  };
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: ScreenHome(),
  ));
}