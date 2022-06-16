import 'package:flutter/material.dart';

class UserInfo extends ChangeNotifier {
  final _data = {};
  String get imageUrl => _data['imageUrl'] ?? '';
  String get name => _data['name'] ?? '';
  String get lastMsg => _data['lastMsg'] ?? '';
  bool get isOnline => _data['isOnline'] ?? false;
  int get unreadMsgCount => _data['unreadMsgCount'] ?? 0;

  String get unreadDisplay => unreadMsgCount > 9 ? '9+' : unreadMsgCount.toString();

  UserInfo.from(Map e) {
    _data.addAll(e);
  }
}
