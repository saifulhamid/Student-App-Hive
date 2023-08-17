import 'package:flutter/material.dart';
import 'package:student_app/db/funcitons/dbfunctions.dart';
import 'package:student_app/db/model/studentmodel.dart';
import 'package:student_app/screens/add_students.dart';
import 'package:student_app/screens/detailscreen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();

    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ValueListenableBuilder<List<StudentModel>>(
        valueListenable: studentListNotifier,
        builder: (BuildContext context, List<StudentModel> studentList, Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text('${data.age} ${data.department} ${data.location} ${data.guardian}'),
                trailing: IconButton(
                  onPressed: () {
                    if (data.id != null) {
                      deleteStudent(data.id!);
                    } else {
                      print('Student id is null, Unable to delete');
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailedScreen(index),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: studentList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudentWidget(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
