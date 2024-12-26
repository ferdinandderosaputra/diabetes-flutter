import 'package:flutter/material.dart';
import 'package:diabetes/utils/theme.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips & Artikel'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildArticleCard(
            'Tips Menjaga Gula Darah Tetap Stabil',
            'Kenali cara-cara efektif mengontrol kadar gula darah Anda...',
            'assets/images/tips1.jpg',
          ),
          _buildArticleCard(
            'Menu Makanan Sehat untuk Diabetesi',
            'Panduan lengkap menyusun menu makanan sehat...',
            'assets/images/tips2.jpg',
          ),
          _buildArticleCard(
            'Olahraga yang Aman untuk Penderita Diabetes',
            'Rekomendasi aktivitas fisik yang tepat...',
            'assets/images/tips3.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(String title, String subtitle, String imageUrl) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            ),
            child: Center(
              child: Icon(Icons.image, size: 50, color: Colors.grey[400]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Baca Selengkapnya',
                    style: TextStyle(color: AppTheme.primaryRed),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
