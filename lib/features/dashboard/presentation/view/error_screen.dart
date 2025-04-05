import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  final String errorMessage;
  const ErrorScreen({super.key, required this.errorMessage});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error Screen"),),
      body: Center(
        child: Text(widget.errorMessage),
      ),
    );
  }
}
