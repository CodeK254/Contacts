// ignore_for_file: prefer_const_constructors

import 'package:db_contacts/screens/addContacts.dart';
import 'package:db_contacts/screens/chatscreen.dart';
import 'package:db_contacts/screens/contacts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ChatScreen(),
        '/contacts': (context) => Contacts(),
        '/addContacts': (context) => AddContacts(),
      },
  ));
}