import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../const/textstyle.dart';

class AppointmentResults extends StatefulWidget {
  const AppointmentResults({super.key});

  @override
  State<AppointmentResults> createState() => _AppointmentResultsState();
}

class _AppointmentResultsState extends State<AppointmentResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColors,
        appBar: AppBar(
          title: Center(
              child: Text(
            'บัตรการนัดหมาย',
            style: h2,
          )),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF00195A), Color(0xFF5CD0BE)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
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
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'หมายเลขนัดหมาย',
                              style: h1,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'กรุณาแสดงหมายเลขนัดหมายทุกครั้งก่อนพบแพทย์',
                              style: subTitle,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.0),

                      Text(
                        'B005',
                        style: TextStyle(
                            color: primary,
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 16.0),

                      // Appointment Detail
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: primary,
                              width: 3.0,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Container(
                                child: Text(
                                  'การนัดหมาย',
                                  style: captionSmall,
                                ),
                              ),

                              SizedBox(width: 8.0),

                              // Date and Time
                              Container(
                                child: Row(
                                  children: [
                                    // Icon Date
                                    // Image.asset('lib/images/xxxxxx.png', height: 18),

                                    // Date
                                    Text(
                                      'Date',
                                      style: bodySmall,
                                    ),

                                    SizedBox(width: 8.0),

                                    // Icon Time
                                    // Image.asset('lib/images/xxxxxx.png', height: 18),

                                    // Time
                                    Text(
                                      'Time',
                                      style: bodySmall,
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 8.0),

                              //Location
                              Container(
                                child: Row(
                                  children: [
                                    // Icon Location
                                    // Image.asset('lib/images/xxxxxx.png', height: 18),

                                    SizedBox(width: 8.0),

                                    // Location
                                    Text(
                                      'Location',
                                      style: bodySmall,
                                    ),
                                  ],
                                ),
                              ),

                              Divider(color: Colors.grey.withOpacity(0.5)),
                              SizedBox(width: 8.0),

                              // Doctor Infomation
                              Container(
                                child: Row(
                                  children: [
                                    // Image Doctor
                                    // Image.asset('lib/images/xxxxxx.png', height: 18),

                                    SizedBox(width: 8.0),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Clinic Name
                                          Text(
                                            'Clinic Name',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(width: 8.0),

                                          //Doctor Name
                                          Text(
                                            'Doctor Name',
                                            style: TextStyle(
                                              color: b100,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    // Location
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16.0),

                      //remark
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: primary,
                              width: 3.0,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'กรุณาวัดความดัน ส่วนสูง ชั่งน้ำหนัก ก่อนพบแพทย์ที่หน้าห้องตรวจ',
                                  style: bodySmall,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 8.0),

                      Text(
                        '***หากมีข้อสงสัยสามารถติดต่อสอบถามได้ที่ 02-523-5262 หรือ 02-523-5263 เฉพาะวันและเวลาทำการ',
                        style: captionSmall,
                      ),

                      SizedBox(height: 24.0),

                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('ตรวจสอบคิว');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      primary, // กำหนดสีพื้นหลังของปุ่ม
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical:
                                          10), // กำหนดขนาดพื้นที่ภายในปุ่ม
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // กำหนดขอบเขตของปุ่ม
                                  ),
                                ),
                                child: Text(
                                  'ตรวจสอบคิว',
                                  style: button,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('ตรวจสอบคิว');
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: primary, width: 2),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // กำหนดขอบเขตของปุ่ม
                                  ),
                                ),
                                child: Text(
                                  'กลับสู่หน้าหลัก',
                                  style: button,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
