import 'package:breakdown/C.dart';
import 'package:breakdown/boxgame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  BoxGame game = BoxGame(tapper);
  flameUtil.addGestureRecognizer(tapper);

  runApp(game.widget);
}
