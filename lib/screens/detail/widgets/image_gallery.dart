import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/spring_button.dart';

class ImageGallery extends StatefulWidget {
  final List<String> imageUrls;
  final double sectionHeight;

  const ImageGallery({super.key, required this.imageUrls, required this.sectionHeight});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.sectionHeight,
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                widget.imageUrls[_activeIndex],
                fit: BoxFit.cover,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppTheme.greyBorder,
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image, size: 48),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 56,
            child: ListView.separated(
              itemCount: widget.imageUrls.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final isSelected = index == _activeIndex;
                return SpringButton(
                  onTap: () {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.darkSlate
                            : AppTheme.greyBorder,
                        width: isSelected ? 2.0 : 1.0,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.imageUrls[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: AppTheme.greyBorder);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
