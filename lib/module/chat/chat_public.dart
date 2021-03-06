library chat;

import 'package:chat_app/model/model.dart';
import 'package:chat_app/module/module.dart';
import 'package:chat_app/res/jons.p.dart';
import 'package:chat_app/res/res.dart';
import 'package:chat_app/service/chat/chat_service.p.dart';
import 'package:chat_app/utils/datetime_utils.p.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
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
part 'content/chat_content.p.dart';
part 'content/bottom_action.p.dart';

ChangeNotifierProvider<_ChatModel> createChat() {
  return ChangeNotifierProvider<_ChatModel>(
    create: (_) => _ChatModel(),
    child: _ChatView(),
  );
}
