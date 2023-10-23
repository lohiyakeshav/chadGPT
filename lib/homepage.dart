import 'package:flutter/material.dart';
import 'package:chad_gpt/chatscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: "chadGPT",
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            elevation: 2,
            title: const Center(child: Text("ChadGPT")),
          ),
          body: ChatScreen(),
        ));
  }
}
