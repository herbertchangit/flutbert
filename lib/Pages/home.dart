import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key,required this.user}) : super(key: key);
  final UserCredential user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController myController = TextEditingController();

  late UserCredential user = widget.user;
  late String studentName, studentID, studyProgramID;
  late double studentGPA;

  late TextEditingController studentNameCtrl = TextEditingController();
  late TextEditingController studentIDCtrl = TextEditingController();
  late TextEditingController studyProgramIDCtrl = TextEditingController();
  late TextEditingController studentGPACtrl = TextEditingController();

  createData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    //Create Map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA,
    };

    documentReference.set(students).whenComplete(() =>
        //ScaffoldMessenger.of(context).showSnackBar(snackBar)
        debugPrint('$studentName successfully created.')
    );
  }

  readData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    
    documentReference.get().then((value) =>
        setState(() {
            studentNameCtrl.text = value.get("studentName").toString();
            studentIDCtrl.text = value.get("studentID").toString();
            studyProgramIDCtrl.text = value.get("studyProgramID").toString();
            studentGPACtrl.text = value.get("studentGPA").toString();
          }
        )
    );
  }

  updateData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    //Create Map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA,
    };
    documentReference.update(students).whenComplete(() => debugPrint('student created.'));
  }

  deleteData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    documentReference.delete().whenComplete(() =>
    debugPrint('$studentName is deleted'));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home ${user.user?.email}'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc('${user.user?.uid}').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          //debugPrint('user : ${user.user?.uid}');
          //debugPrint('user : $user');
          if(snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              return const Text('Loading ...');
            default:
              return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Form(
                        key: _formKey,
                          child: Column(
                            children: <Widget> [
                              TextFormField(
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Please enter your name';}
                                  else {
                                    studentName = input.toString();
                                    return null;
                                  }
                                  },
                                //onSaved: (input) => studentName = input!,
                                controller: studentNameCtrl,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Enter name',
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter student ID';
                                    }
                                  else{
                                    studentID = value.toString();
                                    return null;
                                  }
                                  },
                                //onSaved: (value) => studentID = value!,
                                controller: studentIDCtrl,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Student ID',
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Study Program ID';
                                  }
                                  else{
                                    studyProgramID = value.toString();
                                    return null;
                                  }

                                },
                                //onSaved: (value) => studyProgramID = value!,
                                controller: studyProgramIDCtrl,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Study Program ID',
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter GPA value';
                                  }
                                  else{
                                    studentGPA = double.parse(value);
                                    return null;
                                  }
                                },
                                //onSaved: (value) => studentGPA = value as double,
                                controller: studentGPACtrl,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'GPA',
                                ),
                              ),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      createData();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('$studentName successfully created')),
                                      );
                                    }
                                  },
                                  child: const Text('Register'),
                                ),
                              ),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                      readData();
                                  },
                                  child: const Text('Read'),
                                ),
                              ),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                      updateData();
                                  },
                                  child: const Text('Update'),
                                ),
                              ),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                      deleteData();
                                  },
                                  child: const Text('Delete'),
                                ),
                              ),
                          ],
                      )),
              );
              //checkRole(snapshot);
              //Text(snapshot.data!['name']);
          }
        }
      ),
    );
  }



  Center checkRole(AsyncSnapshot<DocumentSnapshot> snapshot){
    //UserHelper.saveUser(snapshot.data!['users']);
    if(snapshot.data!['role'] == 'admin'){
      return adminPage(snapshot);
    }
    else{
        return userPage(snapshot);
    }
  }

  Center adminPage(AsyncSnapshot<DocumentSnapshot> snapshot){
    return Center(child: Text('${snapshot.data!['role']} ${snapshot.data!['name']}'));
  }

  Center userPage(AsyncSnapshot<DocumentSnapshot> snapshot){
    return Center(child: Text('${snapshot.data!['name']}'));
  }
}

class UserHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User user) async {
    debugPrint('2222222');
    PackageInfo packagesInfo = await PackageInfo.fromPlatform();
    int buildNumber = int.parse(packagesInfo.buildNumber);

    debugPrint('33333333');
    Map<String, dynamic> userData = {
      "name": user.displayName,
      "email": user.email,
      "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
      "created_at": user.metadata.creationTime?.millisecondsSinceEpoch,
      "role":"user",
      "build_number": buildNumber,
    };

    debugPrint('44444444');
    final userRef = _db.collection('users').doc('${user?.uid}');

    if((await userRef.get()).exists){
      await userRef.update({
        "last_login": user.metadata.lastSignInTime?.millisecondsSinceEpoch,
        "build_number":buildNumber,
      });
    }else{
      await userRef.set(userData);
    }
    await _saveDevice(user);
  }

  static _saveDevice(User user) async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String deviceId="";
    Map<String, dynamic> deviceData = {};
    if(Platform.isAndroid){
      final deviceInfo = await deviceInfoPlugin.androidInfo;
      deviceId = deviceInfoPlugin.androidInfo as String;
      deviceData = {
        "os_version":deviceInfo.version.sdkInt.toString(),
        "platform":"android",
        "model":deviceInfo.model,
        "device":deviceInfo.device,
      };
    }

    if(Platform.isIOS){
      final deviceInfo = await deviceInfoPlugin.iosInfo;
      deviceId = deviceInfo.identifierForVendor as String;
      deviceData = {
        "os_version":deviceInfo.systemVersion,
        "platform":"ios",
        "model":deviceInfo.model,
        "device":deviceInfo.name,
      };
    }

    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final deviceRef = _db.collection("users").doc(user.uid).collection("devices").doc(deviceId);

    if((await deviceRef.get()).exists){
      await deviceRef.update({
        "updated_at":nowMs,
        "uninstalled":false,
      });
    }else{
      await deviceRef.set({
        "created_at": nowMs,
        "updated_at": nowMs,
        "uninstalled":false,
        "id":deviceId,
        "device_info":deviceData,
      });
    }
  } //_saveDevice
}
