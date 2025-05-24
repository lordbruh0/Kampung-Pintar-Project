import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saturt/providers/auth_provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const SatuRTApp(),
    ),
  );
}
