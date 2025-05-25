import 'package:flutter/material.dart';

class IuranCard extends StatelessWidget {
  final String namaIuran;
  final String bulan;
  final String jatuhTempo;
  final String jumlahTagihan;
  final String status;
  final VoidCallback onBayar;

  const IuranCard({
    Key? key,
    required this.namaIuran,
    required this.bulan,
    required this.jatuhTempo,
    required this.jumlahTagihan,
    required this.status,
    required this.onBayar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBelumDibayar = status.toLowerCase() == "belum dibayar";

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isBelumDibayar
              ? const Color.fromARGB(255, 206, 164, 154)
              : const Color.fromARGB(255, 187, 223, 204),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  namaIuran,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  bulan,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Detail
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isBelumDibayar
                      ? Colors.black.withOpacity(0.2)
                      : Colors.transparent,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                _infoRow("Jatuh Tempo", jatuhTempo),
                const SizedBox(height: 16),
                _infoRow("Jumlah Tagihan", jumlahTagihan,
                    color: const Color(0xFF539DF3)),
                const SizedBox(height: 16),
                _infoRow(
                  "Status",
                  status,
                  color: isBelumDibayar
                      ? const Color(0xFFC62828)
                      : const Color(0xFF2E7D32),
                )
              ],
            ),
          ),

          const SizedBox(height: 16),

          if (isBelumDibayar)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: onBayar,
                child: const Text(
                  "Bayar Iuran",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value, {Color color = Colors.black}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
