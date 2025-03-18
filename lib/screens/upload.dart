import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({Key? key}) : super(key: key);

  @override
  _FileUploadPageState createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  PlatformFile? selectedFile;

  // 🎯 File Picker Function
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
      });
    }
  }

  // 🎯 File Upload Logic
  void uploadFile() {
    if (selectedFile != null) {
      // ⚡ Add your upload logic here (API call, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'File ${selectedFile!.name} uploaded successfully!',
            style: GoogleFonts.orbitron(color: Colors.greenAccent),
          ),
          backgroundColor: Colors.black,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No file selected!',
            style: GoogleFonts.orbitron(color: Colors.redAccent),
          ),
          backgroundColor: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // ⚡ Cyberpunk Dark Theme
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 8,
        shadowColor: Colors.greenAccent.withOpacity(0.5),
        title: Text(
          "FILE UPLOAD HUB",
          style: GoogleFonts.orbitron(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
            shadows: [
              Shadow(color: Colors.greenAccent.withOpacity(0.8), blurRadius: 8),
              Shadow(color: Colors.blueAccent.withOpacity(0.5), blurRadius: 12),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🎯 File Preview or Upload Button
            selectedFile == null
                ? GestureDetector(
                  onTap: pickFile,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.cyanAccent, Colors.blueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.5),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(
                          "Select File to Upload",
                          style: GoogleFonts.orbitron(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                : _buildFileCard(),
            const SizedBox(height: 20),

            // 🎯 Upload Button
            GestureDetector(
              onTap: uploadFile,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.greenAccent, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload, color: Colors.greenAccent),
                    const SizedBox(width: 10),
                    Text(
                      "Upload File",
                      style: GoogleFonts.orbitron(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🎯 File Card with Details
  Widget _buildFileCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.greenAccent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.5),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.insert_drive_file, size: 50, color: Colors.cyanAccent),
          const SizedBox(height: 10),
          Text(
            selectedFile!.name,
            style: GoogleFonts.orbitron(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${(selectedFile!.size / 1024).toStringAsFixed(2)} KB",
            style: GoogleFonts.orbitron(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
