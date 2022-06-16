import 'dart:math';
import 'package:chat_app/model/model.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';

ChatService get chatSrv => ChatService.shared();

class ChatService extends ChangeNotifier {
  static ChatService? _sInstance;

  final messages = [];
  final users = <UserInfo>[];

  ChatService._() {
    _init();
  }

  factory ChatService.shared() {
    return _sInstance ??= ChatService._();
  }

  void clear() {
    messages.clear();
    users.clear();
  }

  Future<List<UserInfo>> _init() async {
    users.addAll(List.generate(30, (index) {
      return UserInfo.from({
        'name': 'User Name ${index + 1}',
        'imageUrl': ImageUtils.random(),
        'isOnline': index % 3 == 0,
        'unreadMsgCount': Random.secure().nextInt(100),
        'lastMsg': 'Message => loprem isump $index ... :))) Message => loprem isump $index ... :))) Message =>',
      });
    }));
    return users;
  }
}
