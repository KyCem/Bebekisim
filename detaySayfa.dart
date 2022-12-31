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
            return Container(
              height: 40,
              width: 75,
              child: Text(list[index]),
            );
          }),
    );
  }
}
