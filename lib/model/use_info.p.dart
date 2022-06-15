import 'package:flutter/material.dart';

class UseInfo extends ChangeNotifier {
  final _data = {};
  String get imageUrl => _data['imageUrl'] ?? '';
  String get name => _data['name'] ?? '';
  bool get isOnline => _data['isOnline'] ?? false;

  UseInfo.from(Map e) {
    _data.addAll(e);
  }
}
