import 'dart:io';
import 'dart:ui';

import 'package:breakdown/C.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BoxGame extends Game {
  Size sizeScreen;
  double sizeBorder = 10;
  List<Image> imgTexture;
  List<Sprite> sprBoxes;

  double level;
  double width;

  List<Color> listColor = List<Color>();

  BoxGame(TapGestureRecognizer tapper) {
    init();
    tapper.onTapDown = this.onTapDown;
  }

  void init() async {
    level = 3;
    sprBoxes = List<Sprite>();
    imgTexture = List<Image>();

    resize(await Flame.util.initialDimensions());
    initBoxes();
  }

  void initBoxes() {
    width = sizeScreen.width / level;

    imgTexture.add(Image.file(File("yellow.png")));
    imgTexture.add(Image.file(File("dark.png")));

    for (int i = 0; i < level; i++) {
      for (int k = 0; k < level; k++) {
        bool isBreakable = sprBoxes.length % 2 == 0 ? true : false;
        double x = i * width;
        double y = k * width;

        logger("x : ${x} / y : ${y} : ${isBreakable}");
        if (isBreakable) {
          sprBoxes.add(
              Sprite("yellow.png",
//                x: x, y: y,
                width: width, height: width));
        } else {
          sprBoxes
              .add(Sprite("dark.png",
//            x: x, y: y,
            width: width, height: width));
        }
      }
    }
  }

  @override
  void render(Canvas canvas) {
//    Rect rectBG = Rect.fromLTRB(0, 0, sizeScreen.width, sizeScreen.height);
//    Paint paintBG = Paint();
//    paintBG.color = Colors.black;
//    canvas.drawRect(rectBG, paintBG);

//    canvas.save();
    int index = 0;
    for (int i = 0; i < level; i++) {
      for (int k = 0; k < level; k++) {
        double l = i * width;
        double t = k * width;
//        logger("${index} : l : ${l} / t : ${t}");
//        sprBoxes[index++].renderRect(canvas, Rect.fromLTRB(l, t, l+width, t+width));
        sprBoxes[index++].renderPosition(canvas, Position(l, t));
      }
    }
//    canvas.restore();
  }

  @override
  void update(double c) {}

  @override
  void resize(Size size) {
//    if (sizeScreen == null) {
    sizeScreen = size;
//        Size(size.width - (sizeBorder * 2), size.height - (sizeBorder * 2));
//      sizeinit = true;
//      super.resize(size);
//    }
  }

  void onTapDown(TapDownDetails d) {
    logger("Local : " + d.localPosition.toString());
    logger("Global : " + d.globalPosition.toString());
    for (int i = 0; i < sprBoxes.length; i++) {
      if (sprBoxes[i].src.contains(d.globalPosition)) {
        logger("Check!!! " + i.toString());
      }
    }
  }
}
