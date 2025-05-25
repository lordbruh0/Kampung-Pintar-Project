import 'package:flutter/material.dart';

class Detailkegiatan extends StatefulWidget {
  const Detailkegiatan({super.key});

  @override
  State<Detailkegiatan> createState() => _DetailkegiatanState();
}

class _DetailkegiatanState extends State<Detailkegiatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        title: const Text(
          'Deatail Kegiatan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF4F4F4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://sabdodadi.bantulkab.go.id/assets/files/artikel/kecil_1546045614IMG20181229075429.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Informasi Kegiatan",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF539DF3),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Kegiatan Senam Pagi Bersama Warga",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Color(0xFF7D848D),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Lapangan Manatahan, SMK Telkom Malang",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7D848D),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 18,
                      color: Color(0xFF7D848D),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Sabtu, 31 Juli 2021",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7D848D),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 18,
                      color: Color(0xFF7D848D),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "7.00 AM - 5.30 PM",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7D848D),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tentang Kegiatan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Kegiatan senam pagi bersama warga adalah kegiatan yang diadakan oleh ketua RT untuk menjaga kesehatan warga. Kegiatan ini diadakan setiap hari Sabtu pagi di lapangan Manatahan, SMK Telkom Malang. Kegiatan ini diikuti oleh warga sekitar dan bertujuan untuk meningkatkan kebugaran dan kesehatan warga. Tidak hanya kesehatan, tapi melalui keiatan ini dapat mempererat hubungan antara warga satu sama lain. Kegiatan ini juga diharapkan dapat meningkatkan kesadaran warga akan pentingnya menjaga kesehatan.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7D848D),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Map Lokasi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/mapDummy.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
