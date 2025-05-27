import 'package:flutter/material.dart';
import 'package:saturt/presentation/widgets/user/bottom_navbar_admin.dart';
import 'package:file_picker/file_picker.dart';

class BuatLaporan extends StatefulWidget {
  const BuatLaporan({super.key});

  @override
  State<BuatLaporan> createState() => _BuatLaporanState();
}

class _BuatLaporanState extends State<BuatLaporan> {
  List<LaporanItem> laporanList = [
    LaporanItem(title: 'Laporan Pencurian', icon: Icons.security),
    LaporanItem(title: 'Laporan Kekerasan', icon: Icons.warning),
    LaporanItem(title: 'Laporan Kecelakaan', icon: Icons.car_crash),
    LaporanItem(title: 'Laporan Penganiayaan', icon: Icons.person_off),
    LaporanItem(title: 'Laporan Kehilangan Barang', icon: Icons.luggage),
  ];

  void toggleSelection(int index) {
    setState(() {
      for (int i = 0; i < laporanList.length; i++) {
        laporanList[i].isSelected = (i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol back otomatis
        title: const Text(
          'Buat Laporan',
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
              const Text(
                "Pilih Jenis Laporan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),
              ListView.builder(
                itemCount: laporanList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = laporanList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: item.isSelected
                            ? const Color(0xFF539DF3).withOpacity(0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: item.isSelected
                              ? const Color(0xFF539DF3)
                              : Colors.black.withOpacity(0.8),
                          width: 0.5,
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        leading: Icon(item.icon,
                            color: const Color(0xFF539DF3), size: 24),
                        title: Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: item.isSelected
                                ? const Color(0xFF539DF3)
                                : Colors.black.withOpacity(0.8),
                          ),
                        ),
                        trailing: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: item.isSelected
                                  ? const Color(0xFF539DF3)
                                  : Colors.black.withOpacity(0.8),
                              width: 0.5,
                            ),
                            color: item.isSelected
                                ? const Color(0xFF539DF3)
                                : Colors.transparent,
                          ),
                          child: item.isSelected
                              ? const Icon(Icons.check,
                                  size: 16, color: Colors.white)
                              : null,
                        ),
                        onTap: () => toggleSelection(index),
                      ),
                    ),
                  );
                },
              ),
              Spacer(),
              AnimatedContainer(
                height: 56,
                width: double.infinity,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: laporanList.any((item) => item.isSelected)
                      ? const Color(0xFF539DF3)
                      : Colors.white,
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
                    onTap: laporanList.any((item) => item.isSelected)
                        ? () {
                            final selected = laporanList
                                .firstWhere((item) => item.isSelected);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormLaporan(
                                  jenisLaporan: selected.title,
                                  icon: selected.icon,
                                ),
                              ),
                            );
                          }
                        : null,
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          fontSize: laporanList.any((item) => item.isSelected)
                              ? 20
                              : 19,
                          fontWeight: laporanList.any((item) => item.isSelected)
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: laporanList.any((item) => item.isSelected)
                              ? Colors.white
                              : const Color(0xFF6B7280),
                        ),
                        child: Text(
                          laporanList.any((item) => item.isSelected)
                              ? 'Lanjut'
                              : "Pilih Jenis Laporan",
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
      bottomNavigationBar: ButtomNavBarUser(
        currentIndex: 3,
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

class FormLaporan extends StatefulWidget {
  final String jenisLaporan;
  final IconData icon;

  const FormLaporan({
    super.key,
    required this.jenisLaporan,
    required this.icon,
  });

  @override
  State<FormLaporan> createState() => _FormLaporanState();
}

class _FormLaporanState extends State<FormLaporan> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  bool _isFormValid = false;
  String? _selectedFilePath;
  String? _selectedFileName;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final fields = _getFormFields();
    for (String field in fields) {
      _controllers[field] = TextEditingController();
      // Tambahkan listener untuk memantau perubahan form
      _controllers[field]!.addListener(_checkFormValidity);
    }
  }

  void _checkFormValidity() {
    bool allFieldsFilled = _controllers.values
        .every((controller) => controller.text.trim().isNotEmpty);
    bool hasFile = _selectedFileName != null && _selectedFileName!.isNotEmpty;
    bool isValid = allFieldsFilled && hasFile;

    if (_isFormValid != isValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.removeListener(_checkFormValidity);
      controller.dispose();
    }
    super.dispose();
  }

  List<String> _getFormFields() {
    switch (widget.jenisLaporan) {
      case 'Laporan Pencurian':
        return [
          'Nama Pelapor',
          'No. Telepon',
          'Alamat Pelapor',
          'Tanggal Kejadian',
          'Waktu Kejadian',
          'Lokasi Kejadian',
          'Barang yang Dicuri',
          'Kronologi Kejadian',
          'Ciri-ciri Pelaku (jika ada)',
          'Saksi (jika ada)',
          'Keterangan Tambahan'
        ];
      case 'Laporan Kekerasan':
        return [
          'Nama Pelapor',
          'No. Telepon',
          'Alamat Pelapor',
          'Hubungan dengan Korban',
          'Nama Korban',
          'Usia Korban',
          'Jenis Kelamin Korban',
          'Tanggal Kejadian',
          'Waktu Kejadian',
          'Lokasi Kejadian',
          'Jenis Kekerasan',
          'Kronologi Kejadian',
          'Ciri-ciri Pelaku (jika diketahui)',
          'Saksi (jika ada)',
          'Keterangan Tambahan'
        ];
      case 'Laporan Kecelakaan':
        return [
          'Nama Pelapor',
          'No. Telepon',
          'Alamat Pelapor',
          'Tanggal Kejadian',
          'Waktu Kejadian',
          'Lokasi Kejadian',
          'Jumlah Korban',
          'Kronologi Kejadian',
          'Penyebab Kecelakaan',
          'Saksi',
          'Keterangan Tambahan'
        ];
      case 'Laporan Penganiayaan':
        return [
          'Nama Pelapor',
          'No. Telepon',
          'Alamat Pelapor',
          'Hubungan dengan Korban',
          'Nama Korban',
          'Usia Korban',
          'Jenis Kelamin Korban',
          'Tanggal Kejadian',
          'Waktu Kejadian',
          'Lokasi Kejadian',
          'Jenis Penganiayaan',
          'Kronologi Kejadian',
          'Motif Penganiayaan',
          'Saksi',
          'Keterangan Tambahan'
        ];
      case 'Laporan Kehilangan Barang':
        return [
          'Nama Pelapor',
          'No. Telepon',
          'Alamat Pelapor',
          'Nama Barang yang Hilang',
          'Deskripsi Barang',
          'Tanggal Kehilangan',
          'Waktu Kehilangan',
          'Lokasi Terakhir Melihat',
          'Kronologi Kehilangan',
          'Kemungkinan Penyebab',
          'Upaya Pencarian yang Dilakukan',
          'Saksi (jika ada)',
          'Keterangan Tambahan'
        ];
      default:
        return [
          'Nama Pelapor',
          'No. Telepon',
          'Alamat',
          'Tanggal Kejadian',
          'Lokasi Kejadian',
          'Kronologi Kejadian'
        ];
    }
  }

  Widget _buildTextField(String fieldName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controllers[fieldName],
            decoration: InputDecoration(
              hintText: 'Masukkan $fieldName',
              hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFFE2E8F0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFFE2E8F0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF539DF3),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            keyboardType: _getKeyboardType(fieldName),
            maxLines: _isMultilineField(fieldName) ? 4 : 1,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$fieldName tidak boleh kosong';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  TextInputType _getKeyboardType(String fieldName) {
    if (fieldName.toLowerCase().contains('telepon') ||
        fieldName.toLowerCase().contains('usia') ||
        fieldName.toLowerCase().contains('jumlah')) {
      return TextInputType.number;
    } else if (fieldName.toLowerCase().contains('tanggal')) {
      return TextInputType.datetime;
    }
    return TextInputType.text;
  }

  bool _isMultilineField(String fieldName) {
    return fieldName.toLowerCase().contains('alamat') ||
        fieldName.toLowerCase().contains('kronologi') ||
        fieldName.toLowerCase().contains('keterangan') ||
        fieldName.toLowerCase().contains('deskripsi') ||
        fieldName.toLowerCase().contains('ciri-ciri') ||
        fieldName.toLowerCase().contains('upaya') ||
        fieldName.toLowerCase().contains('motif');
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Map<String, String> formData = {};
      _controllers.forEach((key, controller) {
        formData[key] = controller.text;
      });

      // Tampilkan dialog konfirmasi
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Konfirmasi ${widget.jenisLaporan}'),
          content: const Text('Apakah data yang Anda masukkan sudah benar?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Di sini Anda bisa menambahkan logika untuk menyimpan data
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.jenisLaporan} berhasil diajukan!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF539DF3),
              ),
              child: const Text('Kirim Laporan',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        title: Text(
          widget.jenisLaporan,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF4F4F4),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF539DF3).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF539DF3).withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      widget.icon,
                      color: const Color(0xFF539DF3),
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.jenisLaporan,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF539DF3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Silakan lengkapi form laporan berikut:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              ..._getFormFields().map((field) => _buildTextField(field)),
              const SizedBox(height: 10),
              const Text(
                'Upload Bukti',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              FilePickerContainer(
                selectedFileName: _selectedFileName,
                onFileSelected: (filePath, fileName) {
                  setState(() {
                    _selectedFilePath = filePath;
                    _selectedFileName = fileName;
                  });
                  _checkFormValidity();
                },
              ),
              const SizedBox(height: 35),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: _isFormValid ? const Color(0xFF539DF3) : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: _isFormValid
                        ? const Color(0xFF539DF3)
                        : const Color(0xFFE2E8F0),
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
                    onTap: _isFormValid ? _submitForm : null,
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        style: TextStyle(
                          fontSize: _isFormValid ? 18 : 17,
                          fontWeight:
                              _isFormValid ? FontWeight.w600 : FontWeight.w500,
                          color: _isFormValid
                              ? Colors.white
                              : Colors.black.withOpacity(0.7),
                        ),
                        child: Text(
                          _isFormValid
                              ? 'Kirim Laporan'
                              : 'Lengkapi Form & Upload Bukti',
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
                        : 'Pilih file bukti kejadian',
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

class LaporanItem {
  final String title;
  final IconData icon;
  bool isSelected;

  LaporanItem({
    required this.title,
    required this.icon,
    this.isSelected = false,
  });
}
