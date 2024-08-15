
import 'package:dartz/dartz.dart';
import 'package:thummim/core/configs/storage_box.dart';
import 'package:thummim/core/helpers/network_call_managers.dart';
import 'package:thummim/core/helpers/shared_preference_manager.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/helpers/network_exceptions.dart';

class ProfileService{
  final ApiClient apiClient;
  ProfileService({required this.apiClient});

    Future<Either<String,dynamic>> getProfile() async {
    try{
      final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
      final userId = SharedPreferencesManager.getInt(PrefKeys.userId);
      final response = await apiClient.get(
      url: AppEndpoints.profile, token: otpToken,
      data: {
         "user_id": userId
      }
    );
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        print(ex);
        return Left(ex);
    }
   }

}