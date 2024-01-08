import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AiTranslatorScreen extends StatelessWidget {
  const AiTranslatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return  Scaffold(
      appBar: AppBar(
        title: Text("AiTranslatorScreen"),
      ),
    );
  }
}
