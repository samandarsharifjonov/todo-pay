import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paynowuz/screens/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model/user_model.dart';

class Users with ChangeNotifier {
  String _name = '';
  double _summa = 0;
  String? _image;
  final _list = <User>[];
  List<User> get list => [..._list];
  String get name => _name;
  String? get image => _image;
  double get summa => _summa;

  Future<void> initializeUsers() async {
    try{
      await loadFromSharedPreferences();
    }catch(error){
      print('initializeUsers ---------ERROR ---- $error');
    }

  }

  Users(){
    loadFromSharedPreferences();
  }

  void addUser(String name) async {
    _name = name;
    await saveNameToSharedPreferences();
    await saveListToSharedPreferences();
    notifyListeners();
  }

  Future<void> saveNameToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _name); // Ismni saqlash
  }


  Future<void> saveListToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List tempList = _list.map((user) => user.toJson()).toList();
    await prefs.setString('userList', jsonEncode(tempList));
  }

  Future<void> saveBalanceToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('userAmount', _summa);
  }

  Future<void> saveImageToSharedPreferences() async {
    if (_image != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userImage', _image!);
    }
  }

  Future<void> loadImageFromSharedPreferences() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? imagePath = prefs.getString('userImage');
      if (imagePath != null && File(imagePath).existsSync()) {
        _image = File(imagePath).path;
      } else {
        _image = null;
      }
      notifyListeners();
    }catch(error){
      print('loadImageFromSharedPreferences ----------------- $error');
    }
  }

  Future<void> deleteImageFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userImage');
    _image = null;
    notifyListeners();
  }

  Future<void> loadFromSharedPreferences() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _name = prefs.getString('userName') ?? '';
      _summa = prefs.getDouble('userAmount') ?? 0.0;

      String? userListString = prefs.getString('userList');
      if (userListString != null) {
        List<dynamic> tempList = jsonDecode(userListString);
        _list.clear();
        _list.addAll(tempList.map((user) => User.fromJson(user)).toList());
      }

      await loadImageFromSharedPreferences();
      notifyListeners();

    }catch(e){
      print('loadFromSharedPreferences ------------------------------------ $e');
    }
  }

  Future<void> clearSharedPreferences(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _name = '';
    _summa = 0.0;
    _list.clear();
    await deleteImageFromSharedPreferences();
    Navigator.of(context).pushReplacementNamed(Onboarding.routName);
    notifyListeners();
  }



  void sendPayUser(String name, double amount, String imgPath, DateTime date, TimeOfDay time) {
    _list.insert(
        0,
        User(
          id: UniqueKey(),
          name: name,
          imageFile: imgPath,
          dateTime: date,
          amount: amount,
          isPrice: true,
          time: time,
        ));
    _summa -= amount;
    saveBalanceToSharedPreferences();
    saveListToSharedPreferences();
    notifyListeners();
  }

  void requestPayUser(String name, double amount, String imgPath, DateTime date,
      TimeOfDay time) {

    _list.insert(
        0,
        User(
          id: UniqueKey(),
          name: name,
          imageFile: imgPath,
          amount: amount,
          dateTime: date,
          time: time,
          isPrice: false,
        ));
    _summa += amount;
    saveBalanceToSharedPreferences();
    saveListToSharedPreferences();
    notifyListeners();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path).path;
      await saveImageToSharedPreferences();
      notifyListeners();
    }
  }


  void delete(int index, bool isPrice) async{
    if(isPrice == true){
      _summa += _list[index].amount;
      _list.removeAt(index);
      await saveBalanceToSharedPreferences();
      await saveListToSharedPreferences();
      notifyListeners();
    }else{
      _summa -= _list[index].amount;
      _list.removeAt(index);
      await saveBalanceToSharedPreferences();
      await saveListToSharedPreferences();
      notifyListeners();
    }
  }




}
