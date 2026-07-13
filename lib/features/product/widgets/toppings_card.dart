import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_sizes.dart';

class ToppingsCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onAdd;
  final Color buttonColor;
  const ToppingsCard({
    super.key,
    required this.image,
    required this.title,
    this.onAdd,
    this.buttonColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.spacingHeight150,
      width: AppSizes.spacingWidth100,
      decoration: BoxDecoration(
        color: const Color(0xff433536),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.08),
                  blurRadius: 10,
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              height: AppSizes.spacingHeight60,
              width: AppSizes.spacingWidth80,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 6,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onAdd,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
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
