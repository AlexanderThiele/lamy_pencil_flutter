# LAMY iPadOS SDK wrapper for Flutter

Flutter Wrapper for Lamy iPadOS SDK found in https://github.com/Adonit/LAMY-iPadOS-SDK

This Plugin is iOS only. There are no events on other platforms.

## Getting Started

Connect to the pencil and receive Lamy Pencil Button Events. 

All events inside the example project:

```dart
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
```