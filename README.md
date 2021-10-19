
# 複数の解像度を同時にテスト出来るか
main.dartのTextが折り返されるのが正規とする。TextのmaxLinesを１にすれば、横幅の狭い端末は文字が隠れるのでテストで検出したい。

| masterImage | testImage（maxLinesを１指定） |
| ---- | ---- |
| ![firstPage_masterImage](https://user-images.githubusercontent.com/73928886/137845851-fe8d2149-e161-4a09-b766-3fabda7ca6b6.png) | ![firstPage_testImage](https://user-images.githubusercontent.com/73928886/137845852-c4185822-379b-456e-904f-ec10c7d14e6e.png)　|


| maskedDiff | isolatedDiff |
| ---- | ---- |
| ![firstPage_maskedDiff](https://user-images.githubusercontent.com/73928886/137845849-95963f9b-7ff1-4d09-bbb4-b2b3c63bb0e0.png) | ![firstPage_isolatedDiff](https://user-images.githubusercontent.com/73928886/137845844-81b023d8-d684-423c-8d26-2cf978cbb8fa.png) |



以下コードで解像度違いのテストができました
```dart
void main() {
  testGoldens('firstPage', (WidgetTester tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device(size: Size(300, 300), name: 'square'),
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: FirstPage(),
        name: 'default page',
      );
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'firstPage');
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
