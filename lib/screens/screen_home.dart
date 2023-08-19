import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/getx/controller.dart';
import 'package:student_app/screens/add_students.dart';
import 'package:student_app/screens/detailscreen.dart';
import 'package:student_app/widgets%20and%20styles/styles.dart';

class StudentList extends StatelessWidget {
  StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    final Studentgetx studentdetails=Get.put(Studentgetx());
    final studentlist=studentdetails.studentlist;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(
          'Students List',
          style: kwhitestyle,
        ),
        backgroundColor: Colors.blueGrey.shade800,
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          studentdetails.clearlist();
        },
            icon: const Icon(Icons.clear,color: Colors.red,))],
      ),
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child:Obx(() =>  ListView.separated(
                itemCount: studentlist.length,
                itemBuilder: (context, index) {
                  final data=studentlist[index];
                  return  ListTile(
                      onTap: () {
                        // final route=MaterialPageRoute(builder: (context)=> DetailsPage(index:index));
                        // Navigator.push(context, route);
                        Get.to(DetailsPage(index: index));
                      },
                      leading: CircleAvatar(radius: 15,backgroundImage: FileImage(data.image),),
                      title: Text(data.name),
                      subtitle: Text(data.age),
                      trailing:IconButton(icon:const Icon(Icons.delete,color: Colors.red,),
                        onPressed: (){
                          studentdetails.deletestudent(index);
                        },
                      ));
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1,
                    thickness: 1,
                  );
                },
              ),
              )),
          Positioned(
            bottom: 15,
            right: 15,
            child: FloatingActionButton.extended(
              onPressed: () {
                Get.to(MyHomePage());
              },
              label: const Row(
                children: [Text('ADD'), Icon(Icons.add)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
