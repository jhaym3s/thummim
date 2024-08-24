import 'package:dartz/dartz.dart';

import '../../../../../core/api/endpoints.dart';
import '../../../../../core/configs/storage_box.dart';
import '../../../../../core/helpers/network_call_managers.dart';
import '../../../../../core/helpers/network_exceptions.dart';
import '../../../../../core/helpers/shared_preference_manager.dart';

class LessonService{
  LessonService({required this.apiClient, required this.thimPressApiClient});
  final ApiClient apiClient;
  final ThimPressApiClient thimPressApiClient;

  Future<Either<String,dynamic>> getLessonsById({required int courseId}) async {
     final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    try{
      final response = await apiClient.get(
      url: AppEndpoints.getLessonById, 
      token: otpToken,
      data: {
        "course_id": courseId
      }
      );
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        return Left(ex);
    }
   }

   
}