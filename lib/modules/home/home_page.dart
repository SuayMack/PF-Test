import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    // final controller = HomeController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}
