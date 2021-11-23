import 'package:flutter/material.dart';

import 'custom_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlay demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.green,
              ),
              const CustomDropdownWidget(),
              Container(
                width: double.infinity,
                height: 500,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
