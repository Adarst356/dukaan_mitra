import 'package:flutter/material.dart';
import 'package:flutter_demo/core/theme/theme_colors.dart';
import 'package:flutter_demo/core/utils/extensions.dart';
import 'package:get/get.dart';

import '../../../core/utils/spacing.dart';
import '../../../core/widgets/rounded_button.dart';
import '../dashboard_controller.dart';

class PurchaseHistory extends GetView<DashboardController> {
  const PurchaseHistory({super.key});

  static const List<Map<String, String>> completedItems = [
    {
      'name': 'Apple iPhone 16 Pro Max \n 256GB',
      'price': 'Rs.389,900.00',
      'status': 'DELIVERED',
      'image': 'https://m.media-amazon.com/images/I/61bK6PMOC3L._AC_SX200_.jpg',
    },
    {
      'name': 'Apple AirPods Max 2024',
      'price': 'Rs.199,900.00',
      'status': 'DELIVERED',
      'image': 'https://m.media-amazon.com/images/I/81xSSqfBFML._AC_SX200_.jpg',
    },
    {
      'name': 'Apple Mac Mini M2 Chip \n 8GB RAM 256GB',
      'price': 'Rs.189,900.00',
      'status': 'DELIVERED',
      'image': 'https://m.media-amazon.com/images/I/61a2y2WCUGL._AC_SX200_.jpg',
    },
  ];

  static const List<Map<String, String>> pendingItems = [
    {
      'name': 'Spigen Galaxy Z Flip \n 4 Air Skin Case Glitter',
      'price': 'Rs.18,900.00',
      'status': 'PENDING',
      'image': 'https://m.media-amazon.com/images/I/71Q4j4z4+ML._AC_SX200_.jpg',
    },
  ];

  static const List<Map<String, String>> canceledItems = [
    {
      'name': 'Samsung Galaxy A55 Tempered Glass',
      'price': 'Rs.1,500.00',
      'status': 'CANCELLED',
      'image': 'https://m.media-amazon.com/images/I/51bCa8FEJMLL._AC_SX200_.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: context.colorScheme.surfaceContainerLow,
        appBar: AppBar(
          backgroundColor: context.colorScheme.surface,
          elevation: 0.5,
          centerTitle: true,
          title: Text('Purchase History', style: context.textStyle.titleLarge),
          bottom: TabBar(
            labelColor: context.colorScheme.onSurface,
            unselectedLabelColor: context.colorScheme.onSurfaceVariant,
            labelStyle: context.textStyle.titleMedium,
            unselectedLabelStyle: context.textStyle.bodyMedium,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.5,
                color: context.colorScheme.primary,
              ),
            ),
            tabs: const [
              Tab(text: 'Completed'),
              Tab(text: 'Pending'),
              Tab(text: 'Canceled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(
              context: context,
              items: completedItems,
              type: PurchaseType.completed,
            ),
            _buildList(
              context: context,
              items: pendingItems,
              type: PurchaseType.pending,
            ),
            _buildList(
              context: context,
              items: canceledItems,
              type: PurchaseType.canceled,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList({
    required BuildContext context,
    required List<Map<String, String>> items,
    required PurchaseType type,
  }) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return purchaseCard(
          context: context,
          name: item['name'] ?? '',
          price: item['price'] ?? '',
          imageUrl: item['image'] ?? '',
          status: item['status'] ?? '',
          type: type,
        );
      },
    );
  }

  Widget purchaseCard({
    required BuildContext context,
    required String name,
    required String price,
    required String imageUrl,
    required String status,
    required PurchaseType type,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 72,
                  height: 72,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.image_outlined,
                      color: context.colorScheme.outline,
                      size: 28,
                    ),
                  ),
                ),
              ),
              Spacing.w12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        status,
                        style: context.textStyle.labelSmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Spacing.h8,
                    Text(
                      name,
                      style: context.textStyle.titleSmall?.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    Spacing.h8,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Rs. ',
                            style: context.textStyle.bodySmall?.copyWith(
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          TextSpan(
                            text: price.replaceFirst('Rs.', '').trim(),
                            style: context.textStyle.titleMedium?.copyWith(
                              color: context.colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacing.h12,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundedButton(
                backgroundColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.surface,
                radius: 20,
                enabled: true,
                isLoading: false,
                onPressed: () {},
                child: Text(
                  type == PurchaseType.pending ? 'Track' : 'View',
                  style: context.textStyle.labelLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum PurchaseType { completed, pending, canceled }
