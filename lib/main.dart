import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'こんにてゃ1こんにてゃ2こんにてゃ3こんにてゃ4こんにてゃ5こんにてゃ6こんにてゃ7こんにてゃ8こんにてゃ9こんにてゃ10',
              maxLines: 1,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text('ページ移動'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'カレー食べたい1カレー食べたい2カレー食べたい3カレー食べたい4カレー食べたい5カレー食べたい6カレー食べたい7カレー食べたい8カレー食べたい9カレー食べたい10',
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
