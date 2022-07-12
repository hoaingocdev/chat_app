import 'dart:math';
import 'package:chat_app/model/model.dart';
import 'package:chat_app/service/service.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:flutter/material.dart';

ChatService get chatSrv => ChatService.shared();

enum NetworkState { idle, typing, done }

class ChatService extends ChangeNotifier {
  static ChatService? _sInstance;

  final users = <UserInfo>[];
  final messages = <MessageInfo>[];

  final networkState = ValueNotifier(NetworkState.idle);

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

  Future sendMsg(String msg) async {
    networkState.value = NetworkState.idle;
    await _send(msg);

    networkState.value = NetworkState.typing;
    await Future.delayed(const Duration(seconds: 3));

    await _receiveMsg(msg);
    networkState.value = NetworkState.done;
  }

  Future sendImg(List<String> images) async {
    try {
      networkState.value = NetworkState.idle;
      await _sendImg(images);

      networkState.value = NetworkState.typing;
      await Future.delayed(const Duration(seconds: 3));

      await _receiveImg();
      networkState.value = NetworkState.done;
    } catch (e) {
      return;
    }
  }

  Future _sendImg(List<String> images) async {
    final msg = MessageInfo(
      date: DateTime.now(),
      status: MessageStatus.send,
      type: MessageType.image,
      images: List.generate(images.length, (index) {
        return ImageUtils.random(
          width: 500 * Random.secure().nextInt(10),
          height: 100 * Random.secure().nextInt(20),
        );
      }),
    );
    messages.add(msg);
    return notifyListeners();
  }

  Future _receiveImg() async {
    final msg = MessageInfo(
      date: DateTime.now(),
      status: MessageStatus.receive,
      type: MessageType.image,
      images: List.generate(Random.secure().nextInt(10), (index) {
        return ImageUtils.random(
          width: 500 * Random.secure().nextInt(10),
          height: 100 * Random.secure().nextInt(20),
        );
      }),
    );
    messages.add(msg);
    return notifyListeners();
  }

  Future _send(String msg) async {
    final messageInfo = MessageInfo(
      date: DateTime.now(),
      content: msg,
      status: MessageStatus.send,
      type: MessageType.text,
    );
    messages.add(messageInfo);
    return notifyListeners();
  }

  Future _receiveMsg(String sentMsg) async {
    final receiveMsg = await platformSrv.receiveMessage(sentMsg);
    final msg = MessageInfo(
      date: DateTime.now(),
      content: receiveMsg,
      status: MessageStatus.receive,
      type: MessageType.text,
    );
    messages.add(msg);
    return notifyListeners();
  }

  void _initUsers() {
    users.addAll(List.generate(30, (index) {
      return UserInfo.from({
        'name': 'User Name ${index + 1}',
        'imageUrl': ImageUtils.random(),
        'isOnline': index % 3 == 0,
        'unreadMsgCount': Random.secure().nextInt(15),
        'lastMsg': '$index' + StringUtils.generateRandomString(100),
      });
    }));
  }

  void _initMessages() {
    final textLs = List.generate(10, (index) {
      return MessageInfo(
        content: '$index' + StringUtils.generateRandomString(100),
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
        images: List.generate(Random.secure().nextInt(10), (index) {
          return ImageUtils.random(
            width: 500 * Random.secure().nextInt(10),
            height: 100 * Random.secure().nextInt(20),
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
