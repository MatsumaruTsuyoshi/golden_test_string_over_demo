import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:golden_string_over_demo/main.dart';

void main() {
  testGoldens('pc', (WidgetTester tester) async {
    //デバイスの画面サイズ
    final size = Size(1100, 600);
    //第一引数はどのWidgetをビルドするのか指定、どのサイズにビルドするかがsurfaceSize
    await tester.pumpWidgetBuilder(MyApp(), surfaceSize: size);
    //正規のスクリーンショットと同じかテストする
    await screenMatchesGolden(tester, 'pc');
  });
  testGoldens('smartPhone', (WidgetTester tester) async {
    //デバイスの画面サイズ
    final size = Size(415, 896);
    //第一引数はどのWidgetをビルドするのか指定、どのサイズにビルドするかがsurfaceSize
    await tester.pumpWidgetBuilder(MyApp(), surfaceSize: size);
    //正規のスクリーンショットと同じかテストする
    await screenMatchesGolden(tester, 'smartPhone');
  });
}
