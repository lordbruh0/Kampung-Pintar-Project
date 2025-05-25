import 'package:flutter/material.dart';
import 'package:saturt/presentation/pages/user/components/iuran/uploadBuktiPembayaran.dart';

class FormBayarTagihan extends StatefulWidget {
  const FormBayarTagihan({super.key});

  @override
  State<FormBayarTagihan> createState() => _FormBayarTagihanState();
}

String? selectedMetodePembayaran = 'Pilih Metode Pembayaran';
final List<String> metodePembayaran = [
  'Pilih Metode Pembayaran',
  'Transfer Bank',
  'E-Wallet',
  'Kartu Kredit',
  'Tunai ke bendahara',
];

final TextEditingController catatanController = TextEditingController();
String? buktiPembayaranPath;

bool get hasfull {
  return selectedMetodePembayaran != null &&
      selectedMetodePembayaran != 'Pilih Metode Pembayaran' &&
      buktiPembayaranPath != null &&
      buktiPembayaranPath!.isNotEmpty;
}

class _FormBayarTagihanState extends State<FormBayarTagihan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        title: const Text(
          'Form Pembayaran',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF4F4F4),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pilih Metode Pembayaran",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedMetodePembayaran,
                        isExpanded: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF94A3B8),
                          size: 24,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        elevation: 8,
                        items: metodePembayaran.map((String metodePembayaran) {
                          return DropdownMenuItem<String>(
                            value: metodePembayaran,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(metodePembayaran),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMetodePembayaran = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Unggah Bukti Pembayaran",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FilePickerContainer()
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Catatan Tambahan (Opsional)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Masukkan catatan tambahan (opsional)',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AnimatedContainer(
                height: 56,
                width: double.infinity,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                transform: hasfull
                    ? (Matrix4.identity()..scale(1.01))
                    : (Matrix4.identity()..scale(1.0)),
                decoration: BoxDecoration(
                  color: hasfull ? const Color(0xFF539DF3) : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      // aksi tombol
                    },
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          fontSize: hasfull ? 20 : 19,
                          fontWeight:
                              hasfull ? FontWeight.w600 : FontWeight.w500,
                          color:
                              hasfull ? Colors.white : const Color(0xFF6B7280),
                        ),
                        child: Text(
                          hasfull ? 'Bayar' : "Lengkapi Formulir",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
