import 'dart:io';

class Student{
  final String name;
  final String age;
  final String location;
  final File image;

  Student({
    required this.name,
    required this.age,
    required this.location,
    required this.image});
}