import 'package:flutter/material.dart';
import 'package:shortener_nu/models/url_model.dart';

//Used to get the current point of the user and update it
class ListAliasURL with ChangeNotifier {
  final List<URLInfoModel> _urlList = [];

  addUrl(URLInfoModel listItem) {
    _urlList.insert(0, listItem);
    notifyListeners();
  }

  getUrlList() {
    return _urlList;
  }
}
