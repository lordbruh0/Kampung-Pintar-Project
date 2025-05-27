import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FormBayarTagihan extends StatefulWidget {
  const FormBayarTagihan({super.key});

  @override
  State<FormBayarTagihan> createState() => _FormBayarTagihanState();
}

class _FormBayarTagihanState extends State<FormBayarTagihan> {
  // Variabel state
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
  String? buktiPembayaranName;

  // Getter untuk mengecek apakah form sudah lengkap
  bool get hasfull {
    return selectedMetodePembayaran != null &&
        selectedMetodePembayaran != 'Pilih Metode Pembayaran' &&
        buktiPembayaranPath != null &&
        buktiPembayaranPath!.isNotEmpty;
  }

  // Method untuk update bukti pembayaran
  void updateBuktiPembayaran(String? path, String? name) {
    setState(() {
      buktiPembayaranPath = path;
      buktiPembayaranName = name;
    });
  }

  @override
  void dispose() {
    catatanController.dispose();
    super.dispose();
  }

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
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
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
                                items: metodePembayaran
                                    .map((String metodePembayaran) {
                                  return DropdownMenuItem<String>(
                                    value: metodePembayaran,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
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
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FilePickerContainer(
                            onFileSelected: updateBuktiPembayaran,
                            selectedFileName: buktiPembayaranName,
                          )
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
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
                              controller: catatanController,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                hintText:
                                    'Masukkan catatan tambahan (opsional)',
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
                    ],
                  ),
                ),
              ),
              if (MediaQuery.of(context).viewInsets.bottom == 0)
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
                      onTap: hasfull
                          ? () {
                              // aksi tombol pembayaran
                              print('Metode: $selectedMetodePembayaran');
                              print('Bukti: $buktiPembayaranPath');
                              print('Catatan: ${catatanController.text}');
                            }
                          : null,
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          style: TextStyle(
                            fontSize: hasfull ? 20 : 19,
                            fontWeight:
                                hasfull ? FontWeight.w600 : FontWeight.w500,
                            color: hasfull
                                ? Colors.white
                                : const Color(0xFF6B7280),
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

// Widget FilePickerContainer dengan style yang sama
class FilePickerContainer extends StatefulWidget {
  final Function(String?, String?)? onFileSelected;
  final String? selectedFileName;

  const FilePickerContainer({
    super.key,
    this.onFileSelected,
    this.selectedFileName,
  });

  @override
  State<FilePickerContainer> createState() => _FilePickerContainerState();
}

class _FilePickerContainerState extends State<FilePickerContainer> {
  bool isLoading = false;

  Future<void> _pickFile() async {
    setState(() {
      isLoading = true;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final file = result.files.single;

        // Validasi ukuran file (maksimal 5MB)
        if (file.size > 5 * 1024 * 1024) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ukuran file terlalu besar! Maksimal 5MB'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        // Panggil callback dengan path dan nama file
        if (widget.onFileSelected != null) {
          widget.onFileSelected!(file.path, file.name);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal memilih file: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasFile =
        widget.selectedFileName != null && widget.selectedFileName!.isNotEmpty;

    return GestureDetector(
      onTap: _pickFile,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: hasFile
                    ? const Color(0xFF539DF3).withOpacity(0.1)
                    : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                hasFile ? Icons.check : Icons.attach_file,
                color:
                    hasFile ? const Color(0xFF539DF3) : const Color(0xFF94A3B8),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hasFile
                        ? widget.selectedFileName!
                        : 'Pilih file bukti pembayaran',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: hasFile ? Colors.black : const Color(0xFF64748B),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    hasFile
                        ? 'Tap untuk mengganti file'
                        : 'Format: JPG, PNG, PDF (Max 5MB)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            if (isLoading)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF539DF3)),
                ),
              )
            else
              const Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xFF94A3B8),
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
