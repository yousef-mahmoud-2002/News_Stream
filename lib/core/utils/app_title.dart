import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.newspaper,
          color: Colors.black,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          'News',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        Text(
          'Stream',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
