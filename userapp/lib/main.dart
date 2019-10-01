import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  Map data;
  List usersData;

  getUsers() async {
    http.Response response = await http.get('https://gist.githubusercontent.com/cerberodev/98e9956ebf363ce3762136ef17a80c67/raw/f52af1adfc8962ca67a05f0512abec50fc7ab193/usernodeyflutter.json');
    data = json.decode(response.body);
    setState(() {
    usersData = data['users'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('User List - cerbero.dev'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$index", 
                      style: TextStyle(
                        fontSize: 22.0, 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  //Text("${usersData[index]["_id"]}")
                  CircleAvatar(
                    backgroundImage: NetworkImage(usersData[index]['avatar'],)
                    ),
                    Padding(padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${usersData[index]["firstName"]} ${usersData[index]["lastName"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    )
                ],

              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.amberAccent,
      
    );
  }
}

