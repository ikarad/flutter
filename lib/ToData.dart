
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/UserData.dart';

class ToData extends StatefulWidget {
  final List<MyUserData> userdatas;

  const ToData({Key? key, required this.userdatas}) : super(key: key);

  @override
  State<ToData> createState() => _ToDataState();
}

class _ToDataState extends State<ToData> {
    void _deleteTodo(int index) {
    setState(() {
      widget.userdatas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('userDa')
            .orderBy('Name', descending: false)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<MyUserData> userdatas = [];
            snapshot.data!.docs.forEach((document) {
              userdatas.add(MyUserData(
                nameController: document['Name'],
                phoneController: document['Phone Number'],
                emailController: document['Email'],
                date: document['Date'],
                time: document['Time'],
              ));
            });
            return Scaffold(
              appBar: AppBar(
                title: const Text('To Do List',
                    style: TextStyle(color: Colors.orange)),
                centerTitle: true,
              ),
              body: userdatas.isEmpty
                  ? Center(
                      child: Text(
                        'No Task Now',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.yellow[600],
                        ),
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                        itemCount: userdatas.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.orange[200],
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                userdatas[index].nameController,
                                style: TextStyle(
                                  color: Colors.black87,
                                  decoration: null,
                                ),
                              ),
                              subtitle: Text(
                                userdatas [index].phoneController,
                                style: TextStyle(
                                  color: Colors.black87,
                                  decoration: null,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('userData')
                                      .doc(snapshot.data!.docs[index].id)
                                      .delete();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            );
          }
        },
      ),
    );
  }
}

