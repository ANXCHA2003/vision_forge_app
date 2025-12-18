// จัดการ MaterialApp และตั้งค่าธีมหลักของแอป
import 'package:flutter/material.dart';

import 'features/dashboard/dashboard_page.dart';

class VisionForgeApp extends StatelessWidget {
  const VisionForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0D1B14),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1DE28A),
          brightness: Brightness.dark,
          background: const Color(0xFF0D1B14),
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}
