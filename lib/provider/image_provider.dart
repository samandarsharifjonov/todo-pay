
import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class ImageSendProvider with ChangeNotifier {
  String? _imageSend;
  String? get image => _imageSend;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageSend = File(pickedFile.path).path.toString();
      notifyListeners();
    }
  }

  void restartImg(){
    _imageSend = null;
    notifyListeners();
  }
}


class ImageRequestProvider with ChangeNotifier {
  String? _imageRequest;
  String? get image => _imageRequest;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageRequest = File(pickedFile.path).path.toString();
      notifyListeners();
    }
  }

  void restartImg(){
    _imageRequest = null;
    notifyListeners();
  }
}
