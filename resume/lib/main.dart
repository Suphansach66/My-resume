import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Resume',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true, // ใช้ Material Design 3
        fontFamily: 'Roboto',
      ),
      home: const ResumeHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResumeHomePage extends StatelessWidget {
  const ResumeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resume'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // รูปและชื่อ
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/IMG_7027.jpg'),
            ),
            const SizedBox(height: 12),
            const Text(
              'สุพรรษา ใจกองแก้ว',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'ภูมิลำเนา: จังหวัดแพร่',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // งานอดิเรก
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.favorite_outline),
                title: const Text('งานอดิเรก'),
                subtitle: const Text('อ่านหนังสือ ฟังเพลง วาดรูป'),
              ),
            ),
            const SizedBox(height: 16),

            // ประวัติการศึกษา
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.school_outlined),
                        SizedBox(width: 8),
                        Text(
                          'ประวัติการศึกษา',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(height: 24),

                    // ประถม
                    _buildEduTile('ประถมศึกษา', 'โรงเรียนระเบียบพิทยา', '2559'),
                    const SizedBox(height: 8),

                    // มัธยมต้น
                    _buildEduTile('มัธยมศึกษาตอนต้น', 'โรงเรียนลองวิทยา', '2562'),
                    const SizedBox(height: 8),

                    // มัธยมปลาย
                    _buildEduTile('มัธยมศึกษาตอนปลาย', 'โรงเรียนลองวิทยา', '2565'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEduTile(String level, String school, String year) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          level,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        Text('สถานศึกษา: $school'),
        Text('ปีที่จบ: $year'),
      ],
    );
  }
}
