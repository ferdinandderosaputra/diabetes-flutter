import 'package:flutter/material.dart';
import 'package:diabetes/utils/theme.dart';

class GlucoseTargetScreen extends StatefulWidget {
  const GlucoseTargetScreen({Key? key}) : super(key: key);

  @override
  State<GlucoseTargetScreen> createState() => _GlucoseTargetScreenState();
}

class _GlucoseTargetScreenState extends State<GlucoseTargetScreen> {
  double _fastingTarget = 100;
  double _postMealTarget = 140;
  double _hba1cTarget = 6.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Target Gula Darah",
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
          TextButton(
            onPressed: () {
              // Save target values
            },
            child: Text(
              'Simpan',
              style: TextStyle(
                color: AppTheme.primaryRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildInfoCard(),
            _buildTargetSettings(),
            _buildRecommendationSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryRed,
            AppTheme.primaryRed.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryRed.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Target Gula Darah Anda",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTargetItem(
                "Puasa",
                "${_fastingTarget.toInt()} mg/dL",
                Icons.nightlight_outlined,
              ),
              _buildTargetItem(
                "Setelah Makan",
                "${_postMealTarget.toInt()} mg/dL",
                Icons.restaurant,
              ),
              _buildTargetItem(
                "HbA1c",
                "${_hba1cTarget}%",
                Icons.analytics,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTargetItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTargetSettings() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Atur Target",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildSliderSetting(
            "Gula Darah Puasa",
            _fastingTarget,
            70,
            130,
            "mg/dL",
            (value) => setState(() => _fastingTarget = value),
          ),
          _buildSliderSetting(
            "Gula Darah Setelah Makan",
            _postMealTarget,
            100,
            180,
            "mg/dL",
            (value) => setState(() => _postMealTarget = value),
          ),
          _buildSliderSetting(
            "Target HbA1c",
            _hba1cTarget,
            5.0,
            8.0,
            "%",
            (value) => setState(() => _hba1cTarget = value),
            decimals: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSliderSetting(
    String label,
    double value,
    double min,
    double max,
    String unit,
    Function(double) onChanged, {
    bool decimals = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              decimals ? "$value $unit" : "${value.toInt()} $unit",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryRed,
              ),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          activeColor: AppTheme.primaryRed,
          inactiveColor: AppTheme.primaryRed.withOpacity(0.2),
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              decimals ? "$min $unit" : "${min.toInt()} $unit",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            Text(
              decimals ? "$max $unit" : "${max.toInt()} $unit",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRecommendationSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.lightbulb_outline, color: Colors.amber),
              SizedBox(width: 8),
              Text(
                "Rekomendasi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildRecommendationItem(
            "Target gula darah puasa yang direkomendasikan adalah 80-130 mg/dL",
          ),
          _buildRecommendationItem(
            "Target gula darah 1-2 jam setelah makan adalah <180 mg/dL",
          ),
          _buildRecommendationItem(
            "Target HbA1c yang direkomendasikan adalah <7% untuk kebanyakan orang dewasa",
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: AppTheme.primaryRed, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
