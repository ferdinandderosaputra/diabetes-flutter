import 'package:flutter/material.dart';
import 'package:diabetes/utils/theme.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Data Pribadi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: AppTheme.primaryRed),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildPersonalInfoSection(),
            _buildMedicalInfoSection(),
            _buildEmergencyContactSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: AppTheme.primaryRed.withOpacity(0.1),
            child: Icon(Icons.person, size: 50, color: AppTheme.primaryRed),
          ),
          const SizedBox(height: 15),
          const Text(
            "User",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "ID: DM-2024-001",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return _buildSection(
      "Informasi Pribadi",
      [
        _buildInfoItem("Nama Lengkap", "User"),
        _buildInfoItem("Tanggal Lahir", "15 Januari 1990"),
        _buildInfoItem("Jenis Kelamin", "Laki-laki"),
        _buildInfoItem("Email", "User@email.com"),
        _buildInfoItem("No. Telepon", "+62 812-3456-7890"),
        _buildInfoItem("Alamat", "Jl. Sudirman No. 123, Jakarta Pusat"),
      ],
    );
  }

  Widget _buildMedicalInfoSection() {
    return _buildSection(
      "Informasi Medis",
      [
        _buildInfoItem("Tipe Diabetes", "Type 2"),
        _buildInfoItem("Diagnosis Sejak", "Januari 2020"),
        _buildInfoItem("Golongan Darah", "B+"),
        _buildInfoItem("Berat Badan", "75 kg"),
        _buildInfoItem("Tinggi Badan", "175 cm"),
        _buildInfoItem("Alergi", "Tidak Ada"),
      ],
    );
  }

  Widget _buildEmergencyContactSection() {
    return _buildSection(
      "Kontak Darurat",
      [
        _buildInfoItem("Nama", "Sarah Wijaya"),
        _buildInfoItem("Hubungan", "Istri"),
        _buildInfoItem("No. Telepon", "+62 812-9876-5432"),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
