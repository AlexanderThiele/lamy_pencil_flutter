import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:lamy_pencil_flutter/lamy_pencil_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _lamyPencilFlutterPlugin = LamyPencilFlutter.instance;

  @override
  void initState() {
    super.initState();
    _lamyPencilFlutterPlugin.listen((event) {
      print(event);
    });
  }

  @override
  void dispose() {
    _lamyPencilFlutterPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            ElevatedButton(
                onPressed: () async {
                  print(await _lamyPencilFlutterPlugin.isConnected());
                },
                child: const Text("isConnected")),
            ElevatedButton(
                onPressed: () async {
                  print(await _lamyPencilFlutterPlugin.isEnabled());
                },
                child: const Text("isEnabled")),
            ElevatedButton(
                onPressed: () async {
                  print(await _lamyPencilFlutterPlugin.getBattery());
                },
                child: const Text("getBattery")),
            ElevatedButton(
                onPressed: () async {
                  await _lamyPencilFlutterPlugin.enable();
                },
                child: const Text("enable")),
            ElevatedButton(
                onPressed: () async {
                  await _lamyPencilFlutterPlugin.disable();
                },
                child: const Text("disable")),
            ElevatedButton(
                onPressed: () async {
                  await _lamyPencilFlutterPlugin.connect();
                },
                child: const Text("connect")),
            ElevatedButton(
                onPressed: () async {
                  await _lamyPencilFlutterPlugin.disconnect();
                },
                child: const Text("disconnect")),
                    ],
                  ),
          )),
    );
  }
}
