import 'package:awariapp_assessment/core/widgets/auto_scrolling_text.dart';
import 'package:awariapp_assessment/screens/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/spring_button.dart';
//import '../navigation/main_navigation.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkSlate,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.15),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.4),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30),
                        ),
                        child: Image.network(
                          'https://plus.unsplash.com/premium_photo-1666184127688-ed05d3fd3af4?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                                if (frame == null) {
                                  return Container(
                                    color: AppTheme.accentPeach.withValues(
                                      alpha: 0.2,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.image_outlined,
                                      size: 48,
                                      color: AppTheme.accentPeach,
                                    ),
                                  );
                                }
                                return child;
                              },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppTheme.accentPeach,
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppTheme.accentPeach.withValues(
                                alpha: 0.2,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.image_outlined,
                                size: 48,
                                color: AppTheme.accentPeach,
                              ),
                            );
                          },
                        ),
                      ),

                      Column(
                        children: [
                          const SizedBox(height: 30),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'awari',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //const Spacer(),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      color: AppTheme.accentCream,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppTheme.darkSlate, width: 2),
                    ),
                    child: AutoScrollingText(text: 'TRENDING COLLECTIONS'),
                  ),
                ),
                SpringButton(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNavigation(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.accentPeach,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppTheme.darkSlate, width: 2),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Discover Now',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.darkSlate,
                      ),
                    ),
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
