import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  String? profilePath;

  void setProfilePath(String newPath) async {
    profilePath = newPath;
    notifyListeners();
  }
}
