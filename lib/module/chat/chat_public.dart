library chat;

import 'package:chat_app/module/module.dart';
import 'package:chat_app/res/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/widget/widget.dart';

part 'chat_view.dart';
part 'chat_model.dart';
part 'chat_state.dart';
part 'type/message_send.p.dart';
part 'type/message_receive.p.dart';
part 'type/image_receive.p.dart';
part 'widget/image_widget.p.dart';
part 'widget/send_time.p.dart';
part 'type/image_send.p.dart';

ChangeNotifierProvider<_ChatModel> createChat() {
  return ChangeNotifierProvider<_ChatModel>(
    create: (_) => _ChatModel(),
    child: _ChatView(),
  );
}
