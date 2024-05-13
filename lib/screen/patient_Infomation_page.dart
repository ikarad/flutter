import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/screen/summary_page.dart';
import '../UserData.dart';
import '../const/colors.dart';
import '../const/textstyle.dart';
import '../widget/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class PatientInfomation extends StatefulWidget {
  final Function(MyUserData) onAddData;

  const PatientInfomation({super.key, required this.onAddData});

  @override
  State<PatientInfomation> createState() => _PatientInfomationState();
}

class _PatientInfomationState extends State<PatientInfomation> {
  List<MyUserData> userdatas = [];

  TextEditingController Time = TextEditingController();
  TextEditingController Date = TextEditingController();

  void addTodo(MyUserData userdata) {
    setState(() {
      userdatas.add(userdata);
    });
  }
  final _formKey = GlobalKey<FormState>();
  final digitRegex = RegExp(r"^[0-9]");
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  MyUserData userData = MyUserData(
    nameController: '',
    emailController: '',
    phoneController: '',
    date: DateTime.now(),
    time: TimeOfDay.now(),
  );

  final Future<FirebaseApp> firebase =
      Firebase.initializeApp(); // Create a future Firebase app
  final CollectionReference _userData =
      FirebaseFirestore.instance.collection('userData');

  final myController = TextEditingController();
  late FocusNode myFocusNode;

  Future<void> _selectdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: userData.date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    print(picked);
    if (picked != null) {
      setState(() {
        userData.date = picked;
        // DateTime(picked.year, picked.month, picked.day);
        Date.text = DateFormat.yMd().format(userData.date);;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: userData.time,
    );
    if (picked != null) {
      setState(() {
        userData.time = picked;
        Time.text = userData.time.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Center(
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        'ข้อมูลคนไข้',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '/',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            TextSpan(
                              text: '6',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF00195A), Color(0xFF5CD0BE)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24), // มุมมนบนซ้าย
                          topRight: Radius.circular(24), // มุมมนบนขวา
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ระบุข้อมูลคนไข้',
                            style: h2,
                          ),
                          SizedBox(height: 16.0),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //ชื่อนามสกุลคนไข้
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('ชื่อนามสกุลคนไข้'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //ชื่อ-นามสกุลคนไข้
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'กรอกชื่อ-นามสกุล',
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: primary))),
                                      autofocus: true,
                                      validator: (value) {
                                        //ถ้าไม่พิมพ์
                                        if (value == null || value.isEmpty) {
                                          return 'โปรดกรอกชื่อ-นามสกุลของท่าน';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      onSaved: (String? value) {
                                        userData.nameController = value!;
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),

                                //เบอร์โทรศัพท์
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('เบอร์โทรศัพท์คนไข้'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //เบอร์โทรศัพท์
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'กรอกเบอร์เทรศัพท์',
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: primary))),
                                      autofocus: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'โปรดกรอกเบอร์โทรศัพท์';
                                        } else if (!digitRegex
                                            .hasMatch(value)) {
                                          return "กรอกได้เพียงตัวเลข 0-9 เท่านั้น";
                                        } else if (value.length != 10) {
                                          return "โปรดกรอกเบอร์โทรศัพท์ให้ครบ 10 หลัก";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      onSaved: (String? value) {
                                        userData.phoneController = value!;
                                      },
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8.0),

                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('อีเมลคนไข้'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //เบอร์โทรศัพท์
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'กรอกอีเมล',
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: primary))),
                                      autofocus: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'โปรดกรอกอีเมลของท่าน';
                                        } else if (!emailRegex
                                            .hasMatch(value)) {
                                          return 'โปรดกรอกอีเมลให้ถูกต้อง';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      onSaved: (String? value) {
                                        userData.emailController = value!;
                                      },
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8.0),

                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('วันที่นัดหมาย'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //เบอร์โทรศัพท์
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'เลือกวันนัดหมาย',
                                          prefixIcon: Icon(Icons.calendar_today),
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: primary))),
                                      autofocus: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'โปรดกเลือกวันนัดหมาย';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      onSaved: (dynamic? value) {
                                        userData.date = value!; print(value);
                                      },
                                      onTap: () => _selectdate(context),
                                      readOnly: true,
                                      controller: Date,
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8.0),

                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('เวลาที่นัดหมาย'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    //เบอร์โทรศัพท์
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'เลือกเวลานัดหมาย',
                                          prefixIcon: Icon(Icons.access_time),
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: primary))),
                                      autofocus: true,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'โปรดกเลือกเวลานัดหมาย';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      onSaved: (dynamic? value) {
                                        userData.time = value!;
                                      },
                                      onTap: () => _selectTime(context),
                                      readOnly: true,
                                      controller: Time,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: FloatingActionButton(
                                    onPressed: () async {
                                      // if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        await _userData.add({
                                          'Name': userData.nameController,
                                          'Phone Number': userData.phoneController,
                                          'Email Number': userData.emailController,
                                         
                                        }); //add data to firebase
                                        // _formKey.currentState!.reset();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SummaryPage(userdatas: [],),
                                          ),
                                        );
                                      // }
                                      {}
                                    },
                                    child: Text(
                                      'ถัดไป',
                                      style: button,
                                    ),
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8), // กำหนดขอบเขตของปุ่ม
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
                body: const Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}
