import 'package:flutter/material.dart';
import 'package:flutter_application_6/screen/patient_Infomation_page.dart';

import '../ToData.dart';
import '../UserData.dart';

class HomePage extends StatefulWidget {
  final List<MyUserData> userdatas;
  final Function(MyUserData) onAddData;

  const HomePage({super.key, required this.onAddData, required this.userdatas});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        leading: const Icon(
          Icons.account_circle_rounded,
          color: Colors.white,
        ),
        title:
            const Text('My Todo List', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 500,
                child: ToData(userdatas: widget.userdatas),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[600],
        tooltip: 'Add new list',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientInfomation(
               onAddData: widget.onAddData,
              ),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
