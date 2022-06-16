import 'package:flutter/material.dart';

class UserInfo extends ChangeNotifier {
  final _data = {};
  String get imageUrl => _data['imageUrl'] ?? '';
  String get name => _data['name'] ?? '';
  String get lastMsg => _data['lastMsg'] ?? '';
  bool get isOnline => _data['isOnline'] ?? false;
  int get unreadMsgCount => _data['unreadMsgCount'] ?? 0;

  UserInfo.from(Map e) {
    _data.addAll(e);
  }
}
