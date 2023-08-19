import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/getx/controller.dart';
import 'package:student_app/widgets%20and%20styles/widgets.dart';
import '../widgets and styles/styles.dart';




class DetailsPage extends StatelessWidget {
  final int index;
  DetailsPage({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    final Studentgetx studentdetails=Get.find();
    final studentlist=studentdetails.studentlist[index];
    return  Scaffold(
      appBar: AppBar(
        title: Text('Student Details',style: kwhitestyle),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions:  [IconButton(icon: const Icon(Icons.edit,color: Colors
            .yellow,),
          onPressed: () {
            showDialog(context: context, builder: (BuildContext ctx){
              return alert(ctx,studentlist,index);
            });
          },)],
      ),
      body:  Center(
        child: Card(
            child: SizedBox(height: 300,
              width: 300,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 50,backgroundImage: FileImage(studentlist.image),),
                  box,
                  Text('Name : ${studentlist.name}',style: kfontsize,),
                  box,
                  Text('Age : ${studentlist.age}',style: kfontsize,),
                  box,
                  Text('Class : ${studentlist.location}',style: kfontsize,)
                ],
              ),
            )
        ),
      ),
    );
  }
}