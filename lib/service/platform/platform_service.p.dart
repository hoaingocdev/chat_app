import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PlatformService get platformSrv => PlatformService.shared();

class PlatformService extends ChangeNotifier {
  static PlatformService? _sInstance;
  static const _channel = MethodChannel('chat.service.channel');

  PlatformService._();

  factory PlatformService.shared() {
    return _sInstance ??= PlatformService._();
  }
  Future<String> receiveMessage(String msg) async {
    try {
      final String result = await _channel.invokeMethod(
        'receiveMsg',
        {'msg': msg},
      );
      return result;
    } catch (e) {
      print(e.toString());
      return '';
    }
  }
}
