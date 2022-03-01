// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConnectionManager extends StatelessWidget {
  Future future;
  Function widget;

  ConnectionManager({
    Key? key,
    required this.future,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            // ignore: avoid_unnecessary_containers
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            if (snapshot.hasError)
              // ignore: curly_braces_in_flow_control_structures
              return Text('Deu ruim!');
            else
              // ignore: curly_braces_in_flow_control_structures
              return widget(context, snapshot);
        }
      },
    );
  }
}
