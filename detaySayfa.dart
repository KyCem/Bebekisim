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
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Container(
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
