import 'package:flutter/material.dart';
import 'package:saturt/presentation/widgets/user/bottom_navbar_admin.dart';

class KelolaSurat extends StatefulWidget {
  const KelolaSurat({super.key});

  @override
  State<KelolaSurat> createState() => _KelolaSuratState();
}

class _KelolaSuratState extends State<KelolaSurat> {
  List<SuratItem> suratList = [
    SuratItem(title: 'Surat Keterangan Domisili', icon: Icons.home),
    SuratItem(title: 'Surat Pengantar SKCK', icon: Icons.security),
    SuratItem(
        title: 'Surat Keterangan Tidak Mampu (SKTM)', icon: Icons.money_off),
    SuratItem(title: 'Surat Keterangan Usaha (SKU)', icon: Icons.business),
    SuratItem(title: 'Surat Izin Keramaian', icon: Icons.event),
    SuratItem(title: 'Surat Keterangan Kematian', icon: Icons.person_off),
    SuratItem(title: 'Surat Keterangan Pindah Domisili', icon: Icons.moving),
    SuratItem(title: 'Surat Keterangan Lajang', icon: Icons.person),
    SuratItem(title: 'Surat Keterangan Kelahiran', icon: Icons.child_care),
    SuratItem(
        title: 'Surat Pengantar Nikah (N1, N2, N3, N4)', icon: Icons.favorite),
  ];

  void toggleSelection(int index) {
    setState(() {
      for (int i = 0; i < suratList.length; i++) {
        suratList[i].isSelected = (i == index);
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
          'Buat Surat',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF4F4F4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pilih Jenis Surat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 25),
            ListView.builder(
              itemCount: suratList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = suratList[index];
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
            const SizedBox(height: 35),
            AnimatedContainer(
              height: 56,
              width: double.infinity,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: suratList.any((item) => item.isSelected)
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
                  onTap: suratList.any((item) => item.isSelected)
                      ? () {
                          final selected =
                              suratList.firstWhere((item) => item.isSelected);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormSurat(
                                jenisUrat: selected.title,
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
                        fontSize:
                            suratList.any((item) => item.isSelected) ? 20 : 19,
                        fontWeight: suratList.any((item) => item.isSelected)
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: suratList.any((item) => item.isSelected)
                            ? Colors.white
                            : const Color(0xFF6B7280),
                      ),
                      child: Text(
                        suratList.any((item) => item.isSelected)
                            ? 'Lanjut'
                            : "Pilih Jenis Surat",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtomNavBarUser(
        currentIndex: 2,
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

class FormSurat extends StatefulWidget {
  final String jenisUrat;
  final IconData icon;

  const FormSurat({
    super.key,
    required this.jenisUrat,
    required this.icon,
  });

  @override
  State<FormSurat> createState() => _FormSuratState();
}

class _FormSuratState extends State<FormSurat> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  bool _isFormValid = false;

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
    if (_isFormValid != allFieldsFilled) {
      setState(() {
        _isFormValid = allFieldsFilled;
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
    switch (widget.jenisUrat) {
      case 'Surat Keterangan Domisili':
        return [
          'Nama Lengkap',
          'NIK',
          'Tempat Lahir',
          'Tanggal Lahir',
          'Jenis Kelamin',
          'Agama',
          'Status Perkawinan',
          'Pekerjaan',
          'Alamat Lengkap',
          'Keperluan'
        ];
      case 'Surat Pengantar SKCK':
        return [
          'Nama Lengkap',
          'NIK',
          'Tempat Lahir',
          'Tanggal Lahir',
          'Jenis Kelamin',
          'Agama',
          'Status Perkawinan',
          'Pekerjaan',
          'Alamat Lengkap',
          'Keperluan SKCK'
        ];
      case 'Surat Keterangan Tidak Mampu (SKTM)':
        return [
          'Nama Lengkap',
          'NIK',
          'Tempat Lahir',
          'Tanggal Lahir',
          'Jenis Kelamin',
          'Agama',
          'Status Perkawinan',
          'Pekerjaan',
          'Penghasilan per Bulan',
          'Alamat Lengkap',
          'Keperluan SKTM'
        ];
      case 'Surat Keterangan Usaha (SKU)':
        return [
          'Nama Lengkap',
          'NIK',
          'Tempat Lahir',
          'Tanggal Lahir',
          'Jenis Kelamin',
          'Alamat Lengkap',
          'Nama Usaha',
          'Jenis Usaha',
          'Alamat Usaha',
          'Lama Usaha',
          'Modal Usaha',
          'Keperluan'
        ];
      case 'Surat Izin Keramaian':
        return [
          'Nama Penanggung Jawab',
          'NIK',
          'Alamat',
          'No. Telepon',
          'Nama Acara',
          'Jenis Acara',
          'Tanggal Acara',
          'Waktu Mulai',
          'Waktu Selesai',
          'Lokasi Acara',
          'Jumlah Peserta',
          'Keterangan Tambahan'
        ];
      case 'Surat Keterangan Kematian':
        return [
          'Nama Almarhum/Almarhumah',
          'NIK Almarhum/Almarhumah',
          'Tempat Lahir',
          'Tanggal Lahir',
          'Jenis Kelamin',
          'Agama',
          'Alamat Almarhum/Almarhumah',
          'Tanggal Meninggal',
          'Waktu Meninggal',
          'Tempat Meninggal',
          'Sebab Meninggal',
          'Nama Pelapor',
          'NIK Pelapor',
          'Hubungan dengan Almarhum/Almarhumah'
        ];
      case 'Surat Keterangan Pindah Domisili':
        return [
          'Nama Lengkap',
          'NIK',
          'Tempat Lahir',
          'Tanggal Lahir',
          'Jenis Kelamin',
          'Agama',
          'Status Perkawinan',
          'Pekerjaan',
          'Alamat Asal',
          'Alamat Tujuan',
          'Alasan Pindah',
          'Tanggal Pindah'
        ];
      case 'Surat Keterangan Lajang':
        return [
          'Nama Lengkap',
          'NIK',
          'Tempat Lahir',
          'Tanggal Lahir',
          'Jenis Kelamin',
          'Agama',
          'Pekerjaan',
          'Alamat Lengkap',
          'Keperluan',
          'Pernyataan Status Lajang'
        ];
      case 'Surat Keterangan Kelahiran':
        return [
          'Nama Bayi',
          'Tempat Lahir',
          'Tanggal Lahir',
          'Waktu Lahir',
          'Jenis Kelamin',
          'Berat Badan',
          'Panjang Badan',
          'Nama Ayah',
          'NIK Ayah',
          'Nama Ibu',
          'NIK Ibu',
          'Alamat Orang Tua',
          'Nama Pelapor',
          'NIK Pelapor',
          'Hubungan dengan Bayi'
        ];
      case 'Surat Pengantar Nikah (N1, N2, N3, N4)':
        return [
          'Nama Lengkap Calon Suami',
          'NIK Calon Suami',
          'Tempat Lahir Calon Suami',
          'Tanggal Lahir Calon Suami',
          'Agama Calon Suami',
          'Pekerjaan Calon Suami',
          'Alamat Calon Suami',
          'Status Perkawinan Calon Suami',
          'Nama Lengkap Calon Istri',
          'NIK Calon Istri',
          'Tempat Lahir Calon Istri',
          'Tanggal Lahir Calon Istri',
          'Agama Calon Istri',
          'Pekerjaan Calon Istri',
          'Alamat Calon Istri',
          'Status Perkawinan Calon Istri',
          'Tanggal Rencana Nikah',
          'Tempat Rencana Nikah'
        ];
      default:
        return ['Nama Lengkap', 'NIK', 'Alamat', 'Keperluan'];
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
            maxLines: _isMultilineField(fieldName) ? 3 : 1,
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
        fieldName.toLowerCase().contains('nik') ||
        fieldName.toLowerCase().contains('berat') ||
        fieldName.toLowerCase().contains('panjang') ||
        fieldName.toLowerCase().contains('modal') ||
        fieldName.toLowerCase().contains('penghasilan')) {
      return TextInputType.number;
    } else if (fieldName.toLowerCase().contains('tanggal')) {
      return TextInputType.datetime;
    }
    return TextInputType.text;
  }

  bool _isMultilineField(String fieldName) {
    return fieldName.toLowerCase().contains('alamat') ||
        fieldName.toLowerCase().contains('keterangan') ||
        fieldName.toLowerCase().contains('keperluan') ||
        fieldName.toLowerCase().contains('alasan') ||
        fieldName.toLowerCase().contains('pernyataan');
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
          title: Text('Konfirmasi ${widget.jenisUrat}'),
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
                    content: Text('${widget.jenisUrat} berhasil diajukan!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF539DF3),
              ),
              child:
                  const Text('Ajukan', style: TextStyle(color: Colors.white)),
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
          widget.jenisUrat,
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
                        widget.jenisUrat,
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
                'Silakan lengkapi form berikut:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              ..._getFormFields().map((field) => _buildTextField(field)),
              const SizedBox(height: 30),
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
                          _isFormValid ? 'Ajukan Surat' : 'Lengkapin Form',
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

class SuratItem {
  final String title;
  final IconData icon;
  bool isSelected;

  SuratItem({
    required this.title,
    required this.icon,
    this.isSelected = false,
  });
}
