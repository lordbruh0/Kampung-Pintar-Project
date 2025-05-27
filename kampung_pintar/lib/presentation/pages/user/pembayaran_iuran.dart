import 'package:flutter/material.dart';
import 'package:saturt/presentation/pages/user/components/iuran/cartTagihan.dart';
import 'package:saturt/presentation/pages/user/components/iuran/formBayarTagihan.dart';
import 'package:saturt/presentation/widgets/user/bottom_navbar_admin.dart';

class PembayaranIuranUser extends StatefulWidget {
  const PembayaranIuranUser({super.key});

  @override
  State<PembayaranIuranUser> createState() => _PembayaranIuranUserState();
}

class _PembayaranIuranUserState extends State<PembayaranIuranUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol back otomatis
        title: const Text(
          'Informasi Iuran',
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildSummaryRow(
                    Icons.calendar_today_outlined,
                    'Periode',
                    'Mei 2025',
                    Colors.black,
                    Colors.black,
                  ),
                  const SizedBox(height: 16),
                  _buildSummaryRow(
                    Icons.account_balance_wallet_outlined,
                    'Total Tagihan',
                    'Rp30.000',
                    Colors.black,
                    Colors.black,
                  ),
                  const SizedBox(height: 16),
                  _buildSummaryRow(
                    Icons.info_outline,
                    'Status',
                    'Belum Lunas',
                    Colors.black,
                    const Color(0xFFC62828),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color(0xFF539DF3),
                    size: 28,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        iconColor: Color(0xFF539DF3),
                        prefixIconColor: Color(0xFF539DF3),
                        hintText: 'Cari iuran anda',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.3),
                            fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            IuranCard(
              namaIuran: "Iuran Kebersihan",
              bulan: "Mei 2025",
              jatuhTempo: "31 Mei 2025",
              jumlahTagihan: "Rp30.000",
              status: "Sudah Lunas",
              onBayar: () {
                // Aksi pembayaran di sini
              },
            ),
            IuranCard(
              namaIuran: "Iuran Kebersihan",
              bulan: "Mei 2025",
              jatuhTempo: "31 Mei 2025",
              jumlahTagihan: "Rp30.000",
              status: "Belum Dibayar",
              onBayar: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormBayarTagihan()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavBarUser(
        currentIndex: 1,
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

  Widget _buildSummaryRow(
    IconData icon,
    String label,
    String value,
    Color labelColor,
    Color valueColor,
  ) {
    return Row(
      children: [
        Icon(icon, color: labelColor, size: 20),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: labelColor,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTagihanRow(
    String label,
    String value,
    Color labelColor,
    Color valueColor,
  ) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: labelColor,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
