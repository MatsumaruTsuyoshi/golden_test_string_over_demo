// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:golden_string_over_demo/main.dart';

void main() {
  testGoldens('secondPage', (WidgetTester tester) async {
    //デバイスの画面サイズ
    final size = Size(415, 896);
    //第一引数はどのWidgetをビルドするのか指定、どのサイズにビルドするかがsurfaceSize
    await tester.pumpWidgetBuilder(SecondPage(), surfaceSize: size);
    //正規のスクリーンショットと同じかテストする
    await screenMatchesGolden(tester, 'secondPage');
  });
}
