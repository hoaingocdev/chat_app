import 'package:flutter/material.dart';

class MessageInfo extends ChangeNotifier {
  final _data = {};

  MessageInfo.from(Map e) {
    _data.addAll(e);
  }
}
