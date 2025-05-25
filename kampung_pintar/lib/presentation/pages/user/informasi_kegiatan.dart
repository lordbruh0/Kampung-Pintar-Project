import 'package:flutter/material.dart';
import 'package:saturt/presentation/pages/user/components/informasi%20kegiatan/cartInformasi.dart';
import 'package:saturt/presentation/pages/user/components/informasi%20kegiatan/containerKegiatan.dart';
import 'package:saturt/presentation/widgets/user/bottom_navbar_admin.dart';

class InformasiKegiatan extends StatefulWidget {
  const InformasiKegiatan({super.key});

  @override
  State<InformasiKegiatan> createState() => _InformasiKegiatanState();
}

String selectedCategory = "Semua";

class _InformasiKegiatanState extends State<InformasiKegiatan> {
  Widget _categoryButton(String text, bool isSelected, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategory = text;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF539DF3) : Colors.white,
        foregroundColor:
            isSelected ? Colors.white : Color.fromARGB(255, 109, 109, 109),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : Color.fromARGB(255, 109, 109, 109),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _categoryButton(
                      "Semua", selectedCategory == "Semua", Icons.home),
                  SizedBox(width: 15),
                  _categoryButton("Senam", selectedCategory == "Senam",
                      Icons.fitness_center),
                  SizedBox(width: 15),
                  _categoryButton(
                      "Gotong Royong",
                      selectedCategory == "Gotong Royong",
                      Icons.group_work_outlined),
                  SizedBox(width: 15),
                  _categoryButton("Kesehatan", selectedCategory == "Kesehatan",
                      Icons.local_hospital_outlined),
                  SizedBox(width: 15),
                  _categoryButton("Pendidikan",
                      selectedCategory == "Pendidikan", Icons.school_outlined),
                  SizedBox(width: 15),
                  _categoryButton("Hiburan", selectedCategory == "Hiburan",
                      Icons.theater_comedy_outlined),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ImageNewsCard(
              imageUrl:
                  'https://sabdodadi.bantulkab.go.id/assets/files/artikel/kecil_1546045614IMG20181229075429.jpg',
              category: 'Senam',
              date: 'Sabtu, 31 Juli 2021',
              title: 'Kegiatan Senam Pagi Bersama Warga',
              subtitle:
                  'Kegiatan yang diadakan oleh ketua RT untuk menjaga kesehatan warga',
              onPressed: () {
                Navigator.pushNamed(context, '/warga/detail-kegiatan');
              },
            ),
            const ImageNewsCard(
              imageUrl:
                  'https://drpm.umsida.ac.id/wp-content/uploads/2022/03/WhatsApp-Image-2022-02-28-at-20.29.07.jpeg',
              category: 'Gotong Royong',
              date: 'Minggu, 1 Agustus 2021',
              title: 'Gotong Royong Pembersihan Lingkungan',
              subtitle:
                  'Kegiatan gotong royong membersihkan lingkungan sekitar masjid',
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kegiatan Hari Ini",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 15),
                KegiatanHariIni(
                  imageUrl:
                      'https://sabdodadi.bantulkab.go.id/assets/files/artikel/kecil_1546045614IMG20181229075429.jpg',
                  Kategori: 'Senam',
                  Kegiatan: 'Kegiatan Senam Pagi Bersama Warga',
                  lokasi: 'SMK Telkom Malang, Lapangan Manatahan',
                  onTap: () {
                    print('Kegiatan Senam Pagi Bersama Warga tapped');
                  },
                ),
              ],
            )
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
