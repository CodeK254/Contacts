// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Contacts extends StatefulWidget {

  @override
  State<Contacts> createState() => _ContactsState();
}

class ContactData{
  int id;
  String firstname;
  String lastname;
  String phone;
  String email;
  String label;
  String grouped;
  String saved_date;

  ContactData({required this.id,required this.firstname,required this.lastname, required this.phone,required this.email,required this.label,required this.grouped, required this.saved_date});

  ContactData.fromJson(Map json):
    id = int.parse(json['id']),
    firstname = json['firstname'],
    lastname = json['lastname'],
    phone = json['phone'],
    email = json['email'],
    label = json['label'],
    grouped = json['grouped'],
    saved_date = json['saved_date'];
}

class _ContactsState extends State<Contacts> {

  var data = [];
  var d_data = [];

  _getContacts() async {
    Response response = await get(Uri.parse('https://karu-mart.000webhostapp.com/Contacts/contacts.php'));
    
    print(response.body);
   
    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    _getContacts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(
                Icons.home_outlined,
                size: 25,
                color: Colors.blue,
              ),
              title: Text(
                'Contacts',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'MeriendaOne',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Divider(height: 0, color: Colors.black, thickness: 0.2),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.blue,
                size: 28,
                semanticLabel: 'Search',
              ),
            );
          }
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Contacts',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'PlayfairDisplay',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            )
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {

              },
              child: Icon(
                Icons.search_outlined,
                color: Colors.blue,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Card( 
        elevation: 0.0,
        color: Colors.white,
        child: ListTile(
          textColor: Colors.black,
          onTap: (){},
          title: Row(
            children: [
              Text(
                data[index]['firstname'],
                style: TextStyle(
                  fontFamily: 'Rancho',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
              Text(
                data[index]['lastname'],
                style: TextStyle(
                  fontFamily: 'Rancho',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius:20,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person_sharp,
              color: Colors.black,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.error_outline_rounded,
              color: Colors.yellow,
            ),
          ),
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, '/addContacts');
        },
        child: Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}