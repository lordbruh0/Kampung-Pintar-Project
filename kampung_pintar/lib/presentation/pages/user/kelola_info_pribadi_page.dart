import 'package:flutter/material.dart';
import 'package:saturt/presentation/pages/user/components/akun/containerData.dart';
import 'package:saturt/presentation/widgets/user/bottom_navbar_admin.dart';

class InfoPribadi extends StatefulWidget {
  const InfoPribadi({super.key});

  @override
  State<InfoPribadi> createState() => _InfoPribadiState();
}

class _InfoPribadiState extends State<InfoPribadi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        title: const Text(
          'Info Pribadi',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF4F4F4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/ProfileDummy.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Ryo Hariyono Angwyn",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Color(0xFF1B1E28),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "ryohariyono17@gmail.com",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7D848D),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 19, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Industri Timur Gang Harapan RT.06 RW.05',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1B1E28),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 19, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    InfoRowContainer(
                      icon: Icons.phone,
                      text: '081234567890',
                      subtext: "Nomor Telepon",
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    InfoRowContainer(
                      icon: Icons.numbers,
                      text: '330910150690001',
                      subtext: "Nomor NIK",
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    InfoRowContainer(
                      icon: Icons.cake,
                      text: '17 Oktober 2007 (17 Tahun)',
                      subtext: "Tanggal Lahir",
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    InfoRowContainer(
                      icon: Icons.male,
                      text: 'Pria',
                      subtext: "Jenis Kelamin",
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: InkWell(
                        onTap: () {
                          print('Logout pressed');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Color(0xFF539DF3),
                                  size: 24,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF1B1E28),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavBarUser(
        currentIndex: 4,
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
