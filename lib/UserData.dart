import 'package:flutter/material.dart';

class MyUserData {
  String nameController;
  String phoneController;
  String emailController;
  DateTime date;
  TimeOfDay time;

  MyUserData({
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': nameController,
      'phone': phoneController,
      'email': emailController,
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}',
    };
  }
}
