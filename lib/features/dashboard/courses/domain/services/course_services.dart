import 'package:dartz/dartz.dart';
import 'package:thummim/core/configs/storage_box.dart';
import 'package:thummim/core/helpers/network_exceptions.dart';

import '../../../../../core/api/endpoints.dart';
import '../../../../../core/helpers/network_call_managers.dart';
import '../../../../../core/helpers/shared_preference_manager.dart';

class CourseService{
  CourseService({required this.apiClient, required this.thimPressApiClient});
  final ApiClient apiClient;
  final ThimPressApiClient thimPressApiClient;

  Future<Either<String,dynamic>> getAllCourses() async {
     final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    try{
      final response = await apiClient.get(
      url: AppEndpoints.getAllCourses, 
      token: otpToken
      );
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        return Left(ex);
    }
   }

   Future<Either<String,dynamic>> getAllThimPressCourses() async {
     final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    try{
      final response = await thimPressApiClient.get(
      url: AppEndpoints.getAllCourses, 
      token: otpToken
      );
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        return Left(ex);
    }
   }

   Future<Either<String,dynamic>> getSectionedThimPressCourses({required String courseFilter}) async {
     final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    try{
      final response = await thimPressApiClient.get(
      url: AppEndpoints.getAllCourses, 
      token: otpToken,
      data: {"learned": true},
      params: {"course_filter": courseFilter}
      );
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        return Left(ex);
    }
   }

   Future<Either<String,dynamic>> getCourseById({required int id,}) async {
    try{
      final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
      final response = await apiClient.get(
      url: AppEndpoints.getCourseById, 
      token: otpToken,
      data: {
        "course_id": id
    });
    print("log in $response");
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        return Left(ex);
    }
   }

   Future<Either<String,dynamic>> getPurchasedCourses() async {
     final String otpToken = SharedPreferencesManager.getString(PrefKeys.accessToken);
    try{
      final response = await apiClient.get(
      url: AppEndpoints.getPurchasedCourse, 
      token: otpToken
      );
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        return Left(ex);
    }
   }

   
}