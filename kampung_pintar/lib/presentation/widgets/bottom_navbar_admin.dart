import 'package:flutter/material.dart';

class BottomNavbarAdmin extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbarAdmin({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Warga'),
        BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Keuangan'),
        BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'CCTV'),
        BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Surat'),
        BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Laporan'),
      ],
    );
  }
}
