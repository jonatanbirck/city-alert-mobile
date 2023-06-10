import 'package:flutter/material.dart';

class EmptyWarning extends StatelessWidget {
  final IconData iconData;
  final String message;

  const EmptyWarning({Key? key, required this.iconData, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.all(10.0)),
          Icon(iconData, size: 48),
          const SizedBox(height: 16),
          Text(message, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}