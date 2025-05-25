import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerContainer extends StatefulWidget {
  const FilePickerContainer({super.key});

  @override
  State<FilePickerContainer> createState() => _FilePickerContainerState();
}

class _FilePickerContainerState extends State<FilePickerContainer> {
  String? selectedFileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickFile,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedFileName ?? "Unggah File",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const Icon(
              Icons.upload_file,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }
}
