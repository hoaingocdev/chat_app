import 'dart:math';
import 'package:chat_app/model/model.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';

ChatService get chatSrv => ChatService.shared();

class ChatService extends ChangeNotifier {
  static ChatService? _sInstance;

  final users = <UserInfo>[];
  final messages = <MessageInfo>[];

  ChatService._() {
    clear();
    _initUsers();
    _initMessages();
  }

  factory ChatService.shared() {
    return _sInstance ??= ChatService._();
  }

  void clear() {
    messages.clear();
    users.clear();
  }

  void _initUsers() {
    users.addAll(List.generate(30, (index) {
      return UserInfo.from({
        'name': 'User Name ${index + 1}',
        'imageUrl': ImageUtils.random(),
        'isOnline': index % 3 == 0,
        'unreadMsgCount': Random.secure().nextInt(15),
        'lastMsg': 'Message => loprem isump $index ... :))) Message => loprem isump $index ... :))) Message =>',
      });
    }));
  }

  void _initMessages() {
    final textLs = List.generate(10, (index) {
      return MessageInfo(
        content: 'This is the text',
        date: DateTime.now(),
        type: MessageType.text,
        status: MessageStatus.values[index % 2],
      );
    });
    final imageLs = List.generate(10, (index) {
      return MessageInfo(
        date: DateTime.now(),
        type: MessageType.image,
        status: MessageStatus.values[index % 2],
        images: List.generate(10, (index) {
          return ImageUtils.random(
            width: 100.0 * Random.secure().nextInt(10),
            height: 1080 * Random.secure().nextDouble(),
          );
        }),
      );
    });
    for (var i = 0; i < 10; i++) {
      messages.add(textLs[i]);
      messages.add(imageLs[i]);
    }
    notifyListeners();
  }
}
