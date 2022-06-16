import 'package:flutter/material.dart';

enum MessageType { text, image, sticker }
enum MessageStatus { send, receive }

class MessageInfo extends ChangeNotifier {
  final String? content;
  final List<String>? images;
  final DateTime date;
  final MessageType type;
  final MessageStatus status;

  MessageInfo({
    required this.date,
    this.content,
    this.images,
    this.type = MessageType.text,
    this.status = MessageStatus.send,
  });
}
