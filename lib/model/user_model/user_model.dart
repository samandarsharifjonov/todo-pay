import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  final UniqueKey id;
  final String name;
  final String imageFile;
  final DateTime dateTime;
  final double amount;
  final bool isPrice;
  final TimeOfDay time;

  User({
    required this.id,
    required this.name,
    required this.imageFile,
    required this.dateTime,
    required this.amount,
    required this.isPrice,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'imageFile': imageFile,
      'dateTime': dateTime.toIso8601String(),
      'amount': amount,
      'isPrice': isPrice,
      'time': '${time.hour}:${time.minute}',
    };
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: UniqueKey(),
      name: json['name'],
      imageFile: json['imageFile'],
      dateTime: DateTime.parse(json['dateTime']),
      amount: json['amount'],
      isPrice: json['isPrice'],
      time: TimeOfDay(
        hour: int.parse(json['time'].split(':')[0]),
        minute: int.parse(json['time'].split(':')[1]),
      ),
    );
  }
}
