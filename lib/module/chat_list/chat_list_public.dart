library chat_list;

import 'package:chat_app/model/model.dart';
import 'package:chat_app/module/module.dart';
import 'package:chat_app/res/color.p.dart';
import 'package:chat_app/res/res.dart';
import 'package:chat_app/res/style.p.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/widget/widget.dart';

part 'chat_list_view.dart';
part 'chat_list_model.dart';
part 'chat_list_state.dart';

ChangeNotifierProvider<_ChatListModel> createChatList() {
  return ChangeNotifierProvider<_ChatListModel>(
    create: (_) => _ChatListModel(),
    child: _ChatListView(),
  );
}
