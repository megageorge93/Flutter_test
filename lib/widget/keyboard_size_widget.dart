library flutter_keyboard_size;

import 'package:flutter/material.dart';
import 'package:my_test_proj/widget/screen_height_widget.dart';
import 'package:provider/provider.dart';

export 'package:provider/provider.dart';
export 'package:my_test_proj/widget/screen_height_widget.dart';

class KeyboardSizeProvider extends StatefulWidget {
  final Widget child;
  final double smallSize;

  KeyboardSizeProvider({@required this.child, this.smallSize = 400.0})
      : assert(child != null);

  @override
  _KeyboardSizeProviderState createState() => _KeyboardSizeProviderState();
}

class _KeyboardSizeProviderState extends State<KeyboardSizeProvider> {
  ScreenHeight _screenHeight;

  @override
  Widget build(BuildContext context) {
    _screenHeight = ScreenHeight(
        initialHeight: MediaQuery.of(context).size.height,
        smallSize: widget.smallSize);
    _screenHeight.change(MediaQuery.of(context).viewInsets.bottom);
    return ChangeNotifierProvider.value(
        value: _screenHeight, child: widget.child);
  }
}
