// สร้างเลย์เอาต์หน้าดาชบอร์ดด้วยวิดเจ็ตที่แชร์ร่วมกัน
import 'package:flutter/material.dart';

import 'widgets/dashboard_widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const recentItems = [
      RecentFile(
        label: 'neon_reflection.jpg',
        tag: 'JPG',
        accent: Color(0xFF1DE28A),
      ),
      RecentFile(
        label: 'scan_0921.png',
        tag: 'PNG',
        accent: Color(0xFF7EE0FF),
      ),
      RecentFile(
        label: 'การวิเคราะห์ล้มเหลว',
        tag: 'ERR',
        accent: Color(0xFFE66F6F),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardTopBar(),
              const SizedBox(height: 18),
              const AnalysisHeroCard(),
              const SizedBox(height: 14),
              Text(
                'ถ่ายหรืออัปโหลดรูปภาพ เพื่อวิเคราะห์ลวดลาย สีสัน และวัตถุได้ทันที',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                      height: 1.4,
                    ),
              ),
              const SizedBox(height: 18),
              ActionCard(
                background: const Color(0xFF16DD87),
                shadow: Colors.black.withOpacity(0.35),
                title: 'ถ่ายภาพ',
                subtitle: 'ใช้กล้องของคุณ',
                icon: Icons.photo_camera_rounded,
                iconColor: Colors.black87,
              ),
              const SizedBox(height: 12),
              ActionCard(
                background: const Color(0xFF1A2921),
                shadow: Colors.black.withOpacity(0.25),
                title: 'เลือกรูปภาพ',
                subtitle: 'จากคลังรูปในเครื่อง',
                icon: Icons.image_outlined,
                iconColor: const Color(0xFF1DE28A),
              ),
              const SizedBox(height: 12),
              ActionCard(
                background: const Color(0xFF14221B),
                shadow: Colors.black.withOpacity(0.2),
                title: 'ประวัติการใช้งาน',
                subtitle: 'ดูการวิเคราะห์ย้อนหลัง',
                icon: Icons.arrow_forward_ios_rounded,
                iconColor: Colors.white70,
                iconBackground: const Color(0xFF1A2921),
                compactIcon: true,
              ),
              const SizedBox(height: 22),
              const RecentSection(items: recentItems),
            ],
          ),
        ),
      ),
    );
  }
}
