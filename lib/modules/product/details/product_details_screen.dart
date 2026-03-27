import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utils/spacing.dart';
import 'package:flutter_demo/core/widgets/error_text_widget.dart';
import 'package:flutter_demo/modules/product/details/product_details_controller.dart';
import 'package:get/get.dart';
import '../../../core/network/ui_state.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/widgets/loader.dart';
import '../../../core/widgets/rounded_button.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceContainerLow,
      appBar: AppBar(title: const Text("Product Details"), centerTitle: true),
      body: SingleChildScrollView(
        child: Obx(() {
          return controller.productDetailsState.value.when(
            success: (data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSection(context),
                  Spacing.h12,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.brandName ?? 'GODREJ',
                          style: context.textStyle.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.onSurfaceVariant
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: ThemeColors.colorGold,
                            ),
                            Spacing.w4,
                            Text('4.8', style: context.textStyle.bodySmall),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Spacing.h8,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      data.title ??
                          'Godrej 87 L Edge Cool Blast Desert Air Cooler '
                              '(Unique Ice Drip Technology, 18" wide fan, Wine Red)',
                      style: context.textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                  Spacing.h12,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "₹ ${data.mrp ?? 0}",
                      style: context.textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacing.h12,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 20,
                                color: context.colorScheme.primary,
                              ),
                              Spacing.w8,
                              Text(
                                'In Stock',
                                style: context.textStyle.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          Spacing.h4,
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: Text(
                              'Sold by Godrej Retail and Fulfilled by Prime',
                              style: context.textStyle.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacing.h24,
                ],
              );
            },
            error: (error) => ErrorTextWidget(msg: error),
            loading: () => SizedBox(),
            none: () => SizedBox(),
          );
        }),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Obx(() {
      final state = controller.productDetailsState.value;
      return state.when(
        loading: () => Center(child: Loader()),
        error: (e) => ErrorTextWidget(msg: e),
        none: () => SizedBox(),
        success: (data) {
          final images = data.images ?? [];
          if (images.isEmpty) {
            return Center(
              child: Image.asset("assets/images/Image_not_available.png"),
            );
          }
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final img = images[index].imagePath ?? '';
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        img,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        errorBuilder: (_, _, _) =>
                            Image.asset("assets/images/Image_not_available.png"),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 340,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    controller.updateIndex(index);
                  },
                ),
              ),

          Spacing.h12,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return Obx(
                    () => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: controller.currentIndex.value == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? ThemeColors.colorGold
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      );
    });
  }

  Widget _buildBottomBar(BuildContext context) {
    return SafeArea(
      child: Container(
        color: context.colorScheme.surface,
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 45,
          width: double.infinity,
          child: Obx(() {
            return RoundedButton(
              onPressed: controller.purchaseApply,
              isLoading: controller.loanApplyState.value.isLoading,
              text: 'Buy Now',
              radius: 8,
              backgroundColor: ThemeColors.colorOrange,
              foregroundColor: Colors.white,
            );
          }),
        ),
      ),
    );
  }
}
