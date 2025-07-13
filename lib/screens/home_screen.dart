import 'dart:io';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/widgets/placeholder_widget.dart';
import 'package:contact_app/widgets/screen_contacts.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(padding: EdgeInsets.only(left: 16),
            child: Image.asset(AppImages.topLeftLogo),),
          leadingWidth: screenSize.width *0.3,
        ),
        body: Padding(
            padding: EdgeInsets.all(screenSize.width*0.04),
            child: contacts.isEmpty?
            PlaceholderWidget(contacts: contacts, addContact: addContact,) :
            ScreenContacts(
              contacts: contacts,
              deleteContact: deleteContact,
              addContact: addContact,
              deleteSpecificContact: deleteSpecificContact,
            )
        )
    );
  }

  void addContact() {
    setState(() {});
  }

  void deleteContact(){
    contacts.removeLast();
    setState(() {});
  }

  void deleteSpecificContact(ContactModel contactToDelete) {
    contacts.remove(contactToDelete);
    setState(() {});
  }
}