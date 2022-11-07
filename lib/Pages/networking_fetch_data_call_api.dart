import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(int id) async {
  String uriStr = 'https://jsonplaceholder.typicode.com/albums/$id';
  final response = await http.get(
      Uri.parse(uriStr),
      // Send authorization headers to the backend.
      headers: {HttpHeaders.authorizationHeader: 'Basic your_api_token_here',},
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(const MyFetchDataApp(id: 70,));

class MyFetchDataApp extends StatefulWidget {
  const MyFetchDataApp({super.key, required this.id});
  final int id;

  @override
  State<MyFetchDataApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyFetchDataApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}

// Create a Form widget.
class MyFetchDataForm extends StatefulWidget {
  const MyFetchDataForm({super.key});

  @override
  State<MyFetchDataForm> createState() => _MyFetchDataForm();
}

class _MyFetchDataForm extends State<MyFetchDataForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  late String enterText;
  late Future<Album> futureAlbum;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Data with form'),),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter a number within 1 to 100',
              ),
              controller: myController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number within 1 to 100';
                }
                else{
                  enterText = value.toString();
                  return null;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    futureAlbum = fetchAlbum(int.parse(myController.text));
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: FutureBuilder<Album>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data!.title);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            },
                          ),
                        );
                      },
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Entered : $enterText')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),

          ],
        ),

      ),
    );
  }
}