import 'package:flutter/material.dart' hide AppBar;
import 'package:app_design_system/app_design_system.dart';

import '../../data/models/catalog_home_model.dart';
import '../widgets/featured_banner_widget.dart';
import '../widgets/product_card_widget.dart';

class CatalogHomeScreen extends StatelessWidget {
  final CatalogHomeModel data;

  const CatalogHomeScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            AppBar(
              title: Text(
                data.headerTitle,
                style: AppTextStyles.heading2,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(
              hintText: data.searchHint,
              prefixIcon: AppIcon(AppIcons.search),
            ),
            const SizedBox(height: AppSpacing.md),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = data.categories[index];
                  return AppChip(
                    label: category.label,
                    selected: category.isSelected,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
                itemCount: data.categories.length,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            FeaturedBannerWidget(featured: data.featured),
            const SizedBox(height: AppSpacing.lg),
            Text(
              data.productsSectionTitle,
              style: AppTextStyles.heading4,
            ),
            const SizedBox(height: AppSpacing.smMd),
            ...data.products.map(ProductCardWidget.new),
          ],
        ),
      ),
    );
  }
}
