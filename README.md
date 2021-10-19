
# 複数の解像度を同時にテスト出来るか
以下コードで解像度違いのテストができました
```dart
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
```

# ページ事で同時にテスト出来るか
できました

first_page_golden_test.dart
```dart
void main() {
  testGoldens('firstPage', (WidgetTester tester) async {
    //デバイスの画面サイズ
    final size = Size(415, 896);
    //第一引数はどのWidgetをビルドするのか指定、どのサイズにビルドするかがsurfaceSize
    await tester.pumpWidgetBuilder(FirstPage(), surfaceSize: size);
    //正規のスクリーンショットと同じかテストする
    await screenMatchesGolden(tester, 'firstPage');
  });
}
```

second_page_golden_test.dart
```dart
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
```
