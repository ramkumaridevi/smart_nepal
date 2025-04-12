import 'package:flutter/material.dart';

class AppContext {
  static final AppContext _instance = AppContext._internal();
  BuildContext? _context;

  factory AppContext() {
    return _instance;
  }

  AppContext._internal();

  void setContext(BuildContext context) {
    _context = context;
  }

  BuildContext get context {
    if (_context == null) {
      throw Exception('AppContext: Context has not been set!');
    }
    return _context!;
  }
}
