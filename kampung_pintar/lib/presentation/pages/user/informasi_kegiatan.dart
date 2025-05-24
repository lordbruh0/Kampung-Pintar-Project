import 'package:flutter/material.dart';
import 'package:saturt/presentation/pages/user/components/informasi%20kegiatan/cartInformasi.dart';
import 'package:saturt/presentation/widgets/user/bottom_navbar_admin.dart';

class InformasiKegiatan extends StatefulWidget {
  const InformasiKegiatan({super.key});

  @override
  State<InformasiKegiatan> createState() => _InformasiKegiatanState();
}

class _InformasiKegiatanState extends State<InformasiKegiatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        title: const Text(
          'Informasi Kegiatan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF4F4F4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageNewsCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
              category: 'Teknologi',
              date: 'Sabtu, 31 Juli 2021',
              title: 'PS 5 akan siap di luncurkan\nawal tahun 2022',
              subtitle: 'Sony mengumumkan tanggal peluncuran resmi',
              onPressed: () {
                Navigator.pushNamed(context, '/warga/detail-kegiatan');
              },
            ),
            const ImageNewsCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
              category: 'Teknologi',
              date: 'Sabtu, 31 Juli 2021',
              title: 'PS 5 akan siap di luncurkan\nawal tahun 2022',
              subtitle: 'Sony mengumumkan tanggal peluncuran resmi',
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavBarUser(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/warga/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/warga/iuran');
              break;
            case 2:
              Navigator.pushNamed(context, '/warga/surat');
              break;
            case 3:
              Navigator.pushNamed(context, '/warga/laporan');
              break;
            case 4:
              Navigator.pushNamed(context, '/warga/akun');
              break;
          }
        },
      ),
    );
  }
}
