// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bebek İsim',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bebek isim yaratici'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "İdeal Bebek İsminizi Bulalim ",
              style: TextStyle(fontSize: 23),
            ),
            const Text("A"),
            Row(
              children: [
                const Text("Türkçe Karakter içersin mi?"),
                Switch(
                  // activeColor: Colors.amber,
                  //activeTrackColor: Colors.blue,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  value: isSwitched,
                ),
              ],
            ),
            const Text("Hangi Harf ile başlasin"),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(),
            ),
          ],
        ),
      ),
    );
  }
}
