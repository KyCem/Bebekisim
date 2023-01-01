// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa88e7a),
        title: Text("Size uygun tüm bebek isimleri:",
            style: TextStyle(fontFamily: "NotoSerif", fontSize: 18)),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 2, top: 4),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.8)),
                ),
                height: 40,
                width: 75,
                child: Center(
                    child: Text(
                  list[index],
                  style: TextStyle(fontFamily: "VesperLibre", fontSize: 16),
                )),
              ),
            );
          }),
    );
  }
}
