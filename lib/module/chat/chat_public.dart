library chat;

import 'package:chat_app/res/color.p.dart';
import 'package:chat_app/res/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/widget/widget.dart';

part 'chat_view.dart';
part 'chat_model.dart';
part 'chat_state.dart';

ChangeNotifierProvider<_ChatModel> createChat() {
  return ChangeNotifierProvider<_ChatModel>(
    create: (_) => _ChatModel(),
    child: _ChatView(),
  );
}
