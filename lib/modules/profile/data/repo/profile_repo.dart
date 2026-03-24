
import '../../../../core/managers/network_manager.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/ui_state.dart';
import '../model/user_profile_model.dart';

class ProfileRepo {
  Future<void> getUserProfile(
      void Function(UiState<UserProfileModel>) callback,
      ) async {
    callback(const UiState.loading());

    if (!await isNetworkAvailable()) {
      callback(const UiState.error('No internet connection'));
      return;
    }

    final res = await ApiClient.to.getUserProfile();

    if (res.success == true && res.data != null) {
      callback(UiState.success(res.data!));
    } else {
      callback(UiState.error(res.message ?? 'Error occurred'));
    }
  }
}