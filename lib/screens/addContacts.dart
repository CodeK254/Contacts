// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_element, unnecessary_null_comparison

import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddContacts extends StatefulWidget {

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController choose = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController group = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? image;

  Future _chooseImage() async {
    var imageloc = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(imageloc!.path);
    });
    print(image);
  }

  Future _takePhoto() async {
    var imageloc = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = File(imageloc!.path);
    });
    print(image); 
  }

  var message = '';

  Future _addContacts() async {
    final uri = Uri.parse('https://karu-mart.000webhostapp.com/Contacts/addContacts.php');
    var response = await http.post(uri, body: {
      "fname": fname.text,
      "lname": lname.text,
      "phone": phone.text,
      "email": email.text,
      "label": choose.text,
      "groups": group.text
    });

    setState(() {
      message = jsonDecode(response.body);
    });

    Fluttertoast.showToast(
      msg: message,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () async {
                (fname.text == '' || lname.text == '' || phone.text == '') ? 
                  Fluttertoast.showToast(
                    msg: 'Contact details are not saved',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 12,
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_LONG,
                  )
                  :
                  await _addContacts();
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    fontFamily: 'Rancho',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 1.2,
                  ),
                ),
              )
            ),
          ),
        ],
        title: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Create new contact',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'PlayfairDisplay',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        )
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 0.25,
            ),
            child: 
            image == null ?ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.20),
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 200,
                    color: Colors.blueGrey[400],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        _chooseImage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
            :
            Image.file(image!),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: TextFormField(
              controller: fname,
              decoration: InputDecoration(
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: Icon(Icons.person_outline_rounded, size: 30, color: Colors.black54),
                ),
                hintText: 'First name',
                fillColor: Colors.transparent,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 50, left: 70),
            child: TextFormField(
              controller: lname,
              decoration: InputDecoration(
                // icon: ,
                hintText: 'Last name',
                fillColor: Colors.transparent,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: TextFormField(
              controller: phone,
              decoration: InputDecoration(
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: Icon(Icons.call_outlined, size: 30, color: Colors.black54),
                ),
                hintText: 'Phone',
                fillColor: Colors.transparent,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 70, right: MediaQuery.of(context).size.width * 0.5),
            child: TextFormField(
              controller: choose,
              decoration: InputDecoration(
                // icon: ,
                hintText: 'Choose',
                fillColor: Colors.transparent,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                icon: Padding(
                  padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: Icon(Icons.email_outlined, size: 30, color: Colors.black54),
                ),
                hintText: 'Email',
                fillColor: Colors.transparent,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 70, right: MediaQuery.of(context).size.width * 0.5),
            child: TextFormField(
              controller: group,
              decoration: InputDecoration(
                // icon: ,
                hintText: 'Group',
                fillColor: Colors.transparent,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
            child: Text(
              'MORE FIELDS',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontFamily: 'PlayfairDisplay',
              )
            ),
          )
        ]
      ),
    );
  }
}