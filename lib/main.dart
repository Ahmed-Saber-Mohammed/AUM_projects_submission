import 'package:flutter/material.dart';
import 'widgets/hero_section.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const AUMProjectsApp());
}

class AUMProjectsApp extends StatelessWidget {
  const AUMProjectsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AUM PROJECT',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: const Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: HeroSection(),
              ),
            ),
            SimpleFooter(),
          ],
        ),
      ),
    );
  }
}

class SimpleFooter extends StatelessWidget {
  const SimpleFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      child: Text(
        '© 2025 AUM PROJECT. All rights reserved.',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.grey.shade600,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
