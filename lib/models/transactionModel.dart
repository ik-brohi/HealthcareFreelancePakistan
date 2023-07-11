import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class TransactionModel{
  String title;
  String sender;
  String receiver;
  bool status;
  int amount;
  DateTime date;

  TransactionModel({
    required this.title,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.date,
    required this.status});

  dynamic toJson() => {
    "title": title,
    "sender": sender,
    "receiver": receiver,
    "amount": amount,
    "date": date,
    "status": status
  };
}