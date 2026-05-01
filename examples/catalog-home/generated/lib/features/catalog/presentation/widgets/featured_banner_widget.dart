import 'package:flutter/material.dart';
import 'package:app_design_system/app_design_system.dart';

import '../../data/models/catalog_home_model.dart';

class FeaturedBannerWidget extends StatelessWidget {
  final FeaturedProductModel featured;

  const FeaturedBannerWidget({
    super.key,
    required this.featured,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              featured.eyebrow,
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              featured.title,
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              featured.description,
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            PrimaryButton(
              onPressed: () {},
              label: featured.ctaLabel,
            ),
          ],
        ),
      ),
    );
  }
}
