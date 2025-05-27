import 'package:flutter/material.dart';

class ButtomNavBarUser extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ButtomNavBarUser(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFF4F4F4),
      selectedItemColor: Color(0xFF539DF3),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      elevation: 8,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.camera_outlined), label: 'Kegiatan'),
        BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined), label: 'Iuran'),
        BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined), label: 'Surat'),
        BottomNavigationBarItem(
            icon: Icon(Icons.report_outlined), label: 'Laporan'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded), label: 'Pribadi'),
      ],
    );
  }
}
