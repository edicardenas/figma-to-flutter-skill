class CatalogHomeModel {
  final String headerTitle;
  final String searchHint;
  final String productsSectionTitle;
  final List<CategoryChipModel> categories;
  final FeaturedProductModel featured;
  final List<ProductCardModel> products;

  const CatalogHomeModel({
    required this.headerTitle,
    required this.searchHint,
    required this.productsSectionTitle,
    required this.categories,
    required this.featured,
    required this.products,
  });

  factory CatalogHomeModel.mock() {
    return CatalogHomeModel(
      headerTitle: 'Discover today\'s picks',
      searchHint: 'Search coffee, snacks, beans...',
      productsSectionTitle: 'Popular now',
      categories: const [
        CategoryChipModel(label: 'Coffee', isSelected: true),
        CategoryChipModel(label: 'Snacks', isSelected: false),
        CategoryChipModel(label: 'Gear', isSelected: false),
      ],
      featured: FeaturedProductModel.mock(),
      products: List.generate(
        4,
        (index) => ProductCardModel.mock(id: index),
      ),
    );
  }

  factory CatalogHomeModel.fromJson(Map<String, dynamic> json) {
    return CatalogHomeModel(
      headerTitle: json['header_title'] as String,
      searchHint: json['search_hint'] as String,
      productsSectionTitle: json['products_section_title'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((item) => CategoryChipModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      featured: FeaturedProductModel.fromJson(
        json['featured'] as Map<String, dynamic>,
      ),
      products: (json['products'] as List<dynamic>)
          .map((item) => ProductCardModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CategoryChipModel {
  final String label;
  final bool isSelected;

  const CategoryChipModel({
    required this.label,
    required this.isSelected,
  });

  factory CategoryChipModel.fromJson(Map<String, dynamic> json) {
    return CategoryChipModel(
      label: json['label'] as String,
      isSelected: json['is_selected'] as bool,
    );
  }
}

class FeaturedProductModel {
  final String eyebrow;
  final String title;
  final String description;
  final String ctaLabel;

  const FeaturedProductModel({
    required this.eyebrow,
    required this.title,
    required this.description,
    required this.ctaLabel,
  });

  factory FeaturedProductModel.mock() {
    return const FeaturedProductModel(
      eyebrow: 'Featured roast',
      title: 'Single-origin espresso beans',
      description: 'Balanced body, chocolate finish, and a clean citrus note.',
      ctaLabel: 'Shop now',
    );
  }

  factory FeaturedProductModel.fromJson(Map<String, dynamic> json) {
    return FeaturedProductModel(
      eyebrow: json['eyebrow'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      ctaLabel: json['cta_label'] as String,
    );
  }
}

class ProductCardModel {
  final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final double price;
  final List<String> tags;

  const ProductCardModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
    required this.tags,
  });

  factory ProductCardModel.mock({int id = 0}) {
    return ProductCardModel(
      id: id,
      title: 'House Blend #$id',
      subtitle: '340g bag · medium roast',
      imageUrl: 'https://picsum.photos/seed/catalog-home-$id/240/240',
      price: 14.5 + id,
      tags: const ['Bestseller', 'Fast ship'],
    );
  }

  factory ProductCardModel.fromJson(Map<String, dynamic> json) {
    return ProductCardModel(
      id: json['id'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['image_url'] as String,
      price: (json['price'] as num).toDouble(),
      tags: (json['tags'] as List<dynamic>).map((tag) => tag as String).toList(),
    );
  }
}
