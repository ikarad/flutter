import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/screen/Appointment_results_page.dart';
import '../UserData.dart';
import '../const/colors.dart';
import '../const/textstyle.dart';


class SummaryPage extends StatefulWidget {
  final List<MyUserData> userdatas;
  
  const SummaryPage({super.key, required this.userdatas});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Row(
            children: [
              Spacer(),
              Text(
                'สรุปการนัดหมาย',
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
        .collection('userData')
        .snapshots(), //เรียกข้อมูลจาก firebase จาก Collection 'userData'
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) {
            return const Center(
              child: 
                CircularProgressIndicator(),
            );
          }
          return Container(
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
                        'รายละเอียดการนัดหมาย',
                        style: h2,
                      ),
                      SizedBox(height: 24.0),
                      Container(
                        child: ListView.builder(itemCount: widget.userdatas.length,
                        itemBuilder: (context, index) {
                          return Column(
crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //ชื่อ-นามสกุลคนไข้
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('ชื่อ-นามสกุลคนไข้',style: captionSmall,),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Text(
                                  widget.userdatas[index].nameController,style: bodySmall,),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //เบอร์โทรศัพท์
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('เบอร์โทรศัพท์',style: captionSmall,),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Text(widget.userdatas[index].phoneController,style: bodySmall,),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //อีเมล
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'อีเมล',
                                  style: captionSmall,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Text(widget.userdatas[index].emailController,style: bodySmall,),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //วันที่นัดหมาย
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  widget.userdatas[index].date.toString(),
                                  style: captionSmall,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Text(
                                   widget.userdatas[index].time.toString(),
                                  style: bodySmall,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //เวลาที่นัดมหาย
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'เวลาที่นัดมหาย',
                                  style: captionSmall,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Text(
                                  '07:00 น.',
                                  style: bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                          );
                        }),
                        
                      ),
                      SizedBox(height: 8.0),
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AppointmentResults(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'ยืนยันการนัดหมาย',
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
            )
      );}
        
      ),
    );
  }
}

