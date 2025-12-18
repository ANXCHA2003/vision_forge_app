// รวมวิดเจ็ต UI ที่ใช้ซ้ำได้บนดาชบอร์ด เช่น ท็อปบาร์ การ์ดฮีโร่ การ์ดแอ็กชัน และรายการไฟล์ล่าสุด
import 'package:flutter/material.dart';

class DashboardTopBar extends StatelessWidget {
  const DashboardTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularIconButton(
          icon: Icons.menu_rounded,
          background: const Color(0xFF1A2921),
          onTap: () {},
        ),
        Text(
          'แดชบอร์ด',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
        ),
        CircularIconButton(
          icon: Icons.settings,
          background: const Color(0xFF1A2921),
          onTap: () {},
        ),
      ],
    );
  }
}

class AnalysisHeroCard extends StatelessWidget {
  const AnalysisHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xFF1F3328), Color(0xFF0F2017)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            offset: const Offset(0, 18),
            blurRadius: 28,
            spreadRadius: -12,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -10,
            bottom: -30,
            child: Opacity(
              opacity: 0.25,
              child: Container(
                width: 210,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Color(0xFF1DE28A), Colors.transparent],
                    radius: 0.8,
                    center: Alignment(0.1, 0.1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 18,
            right: 18,
            top: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _Badge(text: 'ขับเคลื่อนด้วย AI'),
                Icon(Icons.more_horiz, color: Colors.white70),
              ],
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 46, 18, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'การวิเคราะห์ภาพ',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'ถ่ายหรืออัปโหลดรูปภาพ เพื่อวิเคราะห์ลวดลาย สีสัน และวัตถุได้ทันที',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                          height: 1.4,
                        ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.white.withOpacity(0.08),
                      child: const Icon(
                        Icons.eco_rounded,
                        color: Color(0xFF1DE28A),
                        size: 42,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.background,
    required this.shadow,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.iconBackground,
    this.compactIcon = false,
  });

  final Color background;
  final Color shadow;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color? iconBackground;
  final bool compactIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: shadow,
            offset: const Offset(0, 12),
            blurRadius: 22,
            spreadRadius: -12,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ],
            ),
          ),
          Container(
            height: compactIcon ? 36 : 46,
            width: compactIcon ? 36 : 46,
            decoration: BoxDecoration(
              color: iconBackground ?? Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: compactIcon ? 18 : 22,
            ),
          ),
        ],
      ),
    );
  }
}

class RecentSection extends StatelessWidget {
  const RecentSection({super.key, required this.items});

  final List<RecentFile> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ไฟล์ล่าสุด',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.white70,
                    letterSpacing: 1.2,
                  ),
            ),
            Text(
              'ดูทั้งหมด',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF1DE28A),
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 132,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => RecentItemCard(file: items[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({super.key, required this.file});

  final RecentFile file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: const Color(0xFF121F18),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 16),
            blurRadius: 24,
            spreadRadius: -14,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                gradient: LinearGradient(
                  colors: [
                    file.accent.withOpacity(0.35),
                    Colors.black.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: _Tag(text: file.tag),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Text(
              file.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.background,
    required this.onTap,
  });

  final IconData icon;
  final Color background;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: background,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class RecentFile {
  const RecentFile({
    required this.label,
    required this.tag,
    required this.accent,
  });

  final String label;
  final String tag;
  final Color accent;
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: const Color(0xFF1DE28A),
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
      ),
    );
  }
}
