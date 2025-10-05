import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              const Color(0xFF0D9488).withOpacity(0.05),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: isMobile
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  'AUM',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'PROJECT',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0D9488),
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: _buildContentSection(context),
            ),
            const SizedBox(width: 80),
            Expanded(
              flex: 4,
              child: _buildActionCards(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildContentSection(context),
          const SizedBox(height: 48),
          _buildActionCards(context),
        ],
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF0D9488).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'INNOVATION HUB',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0D9488),
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Transform Ideas\nInto Reality',
          style: GoogleFonts.poppins(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'AUM Projects empowers innovators to submit and showcase their groundbreaking work. Join our community of creators and bring your vision to life.',
          style: GoogleFonts.inter(
            fontSize: 18,
            color: Colors.black54,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 32,
          runSpacing: 16,
          children: [
            _buildStatItem('500+', 'Projects'),
            _buildStatItem('200+', 'Innovators'),
            _buildStatItem('50+', 'Prototypes'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0D9488),
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildActionCards(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionCard(
          context,
          title: 'Submit Report',
          description: 'Share your research findings and project documentation',
          icon: Icons.description_outlined,
          gradient: const LinearGradient(
            colors: [Color(0xFF0D9488), Color(0xFF14B8A6)],
          ),
          onTap: () => context.go('/submit-report'),
        ),
        const SizedBox(height: 24),
        _buildActionCard(
          context,
          title: 'Submit Prototype',
          description: 'Showcase your working prototypes and innovations',
          icon: Icons.science_outlined,
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Colors.black54,
            ],
          ),
          onTap: () => context.go('/submit-prototype'),
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Get Started',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Text(
        '© 2025 AUM PROJECT. All rights reserved.',
        style: GoogleFonts.inter(
          fontSize: 12,
          color: Colors.black38,
        ),
      ),
    );
  }
}
