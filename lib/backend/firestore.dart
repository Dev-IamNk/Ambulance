import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FCollection{
  FirebaseFirestore fb =FirebaseFirestore.instance;
  Future<void> sendData(String currentLocation,String destination)async{
    CollectionReference collectionReference=fb.collection("ambulance");
    await collectionReference.doc("Data").set({
      "SourceLocation":currentLocation,
      "Hospital":destination,
    });
  }

}

