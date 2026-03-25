import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/extensions.dart';
class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colorScheme.surface,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close, color: context.colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Filters',
          style: context.textStyle.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colorScheme.onSurface,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Clear All',
              style: context.textStyle.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),

      backgroundColor: context.colorScheme.surface,

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  _CategorySection(cs: context.colorScheme, tt: context.textStyle),
                  _Divider(),
                  _PriceRangeSection(cs: context.colorScheme, tt: context.textStyle),
                  _Divider(),
                  _BrandSection(cs: context.colorScheme, tt: context.textStyle),


                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


class _CategorySection extends StatelessWidget {
  final ColorScheme cs;
  final TextTheme tt;

  const _CategorySection({required this.cs, required this.tt});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': 'Headphones', 'count': '1.2k', 'icon': Icons.headphones},
      {'label': 'Cases', 'count': '842', 'icon': Icons.phone_android},
      {'label': 'Chargers', 'count': '315', 'icon': Icons.bolt},
      {'label': 'Cables', 'count': '156', 'icon': Icons.cable},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: tt.titleMedium),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (_, i) {
            final cat = categories[i];
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(cat['icon'] as IconData),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(cat['label'].toString()),
                      Text('${cat['count']} Items',
                          style: tt.bodySmall),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// PRICE
// ─────────────────────────────────────────────
class _PriceRangeSection extends StatelessWidget {
  final ColorScheme cs;
  final TextTheme tt;

  const _PriceRangeSection({required this.cs, required this.tt});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Price Range', style: tt.titleMedium),
        const SizedBox(height: 10),
         RangeSlider(
          values: RangeValues(0, 1200),
          min: 0,
          max: 1500,
          onChanged: null, // static
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// BRAND
// ─────────────────────────────────────────────
class _BrandSection extends StatelessWidget {
  final ColorScheme cs;
  final TextTheme tt;

  const _BrandSection({required this.cs, required this.tt});
  @override
  Widget build(BuildContext context) {
    final brands = ['Apple', 'Samsung', 'Sony', 'OnePlus'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Brand', style: tt.titleMedium),
        const SizedBox(height: 10),
        ...brands.map((b) => Row(
          children: [
            Checkbox(value: false, onChanged: null),
            Text(b),
          ],
        )),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Divider(),
    );
  }
}