library photo_view;

import 'package:chat_app/res/res.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/widget/widget.dart';

part 'photo_view_view.dart';
part 'photo_view_model.dart';
part 'photo_view_state.dart';

ChangeNotifierProvider<_PhotoViewModel> createPhotoView({required List<String> images, int initPage = 0}) {
  return ChangeNotifierProvider<_PhotoViewModel>(
    create: (_) => _PhotoViewModel(images, initPage),
    child: _PhotoViewView(),
  );
}
