import 'dart:convert';

import 'package:api_crud/models/sample_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SampleModel> sampleModels = [];

  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void postData() async {
      var response =
          await http.post(Uri.parse('http://10.0.2.2:8000/user/'), body: {
        "name": _name.text,
        "address": _address.text,
        "email": _email.text,
        "mobile": _mobile.text
      });
      setState(() {});
      Navigator.of(context).pop();
    }

    void createNewRec() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                height: 350,
                child: Center(
                    child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: _name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextField(
                        controller: _address,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Address',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Email',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: TextField(
                        controller: _mobile,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Mobile',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            postData();
                            _name.clear();
                            _address.clear();
                            _email.clear();
                            _mobile.clear();
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                )),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("test"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: sampleModels.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "id: ${sampleModels[index].id}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "name: ${sampleModels[index].name}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "address: ${sampleModels[index].address}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "email: ${sampleModels[index].email}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "mobile: ${sampleModels[index].mobile}",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewRec,
        child: Icon(Icons.add),
      )
    );
  }

  Future<List<SampleModel>> getData() async {
    var response = await http.get(Uri.parse('http://10.0.2.2:8000/user/'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      sampleModels = [];
      for (Map<String, dynamic> index in data) {
        sampleModels.add(SampleModel.fromJson(index));
      }
      
      return sampleModels;
    } else {
      return Future.error('server error');
    }
  }
}
