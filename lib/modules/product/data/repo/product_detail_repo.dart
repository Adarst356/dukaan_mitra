import 'package:flutter_demo/core/managers/network_manager.dart';
import 'package:flutter_demo/core/network/api_client.dart';
import 'package:flutter_demo/core/network/base_res.dart';
import 'package:flutter_demo/core/network/ui_state.dart';

import '../model/product_detail_model.dart';

class ProductDetailsRepo {
  Future<void> getProductDetails(
      int productId,
      void Function(UiState<ProductDetailModel>) callback,
      ) async {
    callback(const UiState.loading());
    if (!await isNetworkAvailable()) {
      callback(const UiState.error('No internet connection'));
      return;
    }
    final res = await ApiClient.to.getProductDetails(productId);
    if (res.success == true && res.data != null) {
      callback(UiState.success(res.data!));
    } else {
      callback(UiState.error(res.message ?? 'Error occurred'));
    }
  }
  void loanApply(
      Object body,
      void Function(UiState<BaseRes> state) callback,
      ) async {
    callback.call(const UiState.loading());
    if (!await isNetworkAvailable()) {
      callback.call(const UiState.error('No internet connection'));
      return;
    }
    var res = await ApiClient.to.purchaseApply(body);

    if (res.success == true) {
      callback.call(UiState.success(res));
    } else {
      callback.call(UiState.error(res.message ?? 'Error occurred'));
    }
  }


/*  /// Fetch all active EMI plans
  Future<void> getEmiPlans(
      void Function(UiState<List<EmiPlanModel>>) callback,
      ) async {
    callback(const UiState.loading());

    if (!await isNetworkAvailable()) {
      callback(const UiState.error('No internet connection'));
      return;
    }

    final res = await ApiClient.to.getEmiPlans();

    if (res.success == true && res.data != null) {
      final activePlans = res.data!.where((p) => p.isActive == true).toList();
      callback(UiState.success(activePlans));
    } else {
      callback(UiState.error(res.message ?? 'Error occurred'));
    }
  }*/
}