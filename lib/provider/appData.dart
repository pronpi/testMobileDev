import 'package:flutter/cupertino.dart';
import 'package:test/model/profile_model.dart';

class AppData with ChangeNotifier {
  late ProfileModel _profileModel;
  ProfileModel get profileModel => _profileModel;
  set profileModel(ProfileModel profileModel) {
    _profileModel = profileModel;
    notifyListeners();
  }
}
