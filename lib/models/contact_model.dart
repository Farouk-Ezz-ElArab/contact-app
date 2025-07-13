import 'dart:io';
import 'package:flutter/material.dart';

class ContactModel {
  String userName;
  String email;
  String phone;
  File? imageFile;

  ContactModel({
    required this.email,
    required this.imageFile,
    required this.phone,
    required this.userName,
  });
}
