import 'package:flutter/material.dart';

class KelolaSurat extends StatefulWidget {
  const KelolaSurat({super.key});

  @override
  State<KelolaSurat> createState() => _KelolaSuratState();
}

class _KelolaSuratState extends State<KelolaSurat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Halaman Kelola Surat',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
