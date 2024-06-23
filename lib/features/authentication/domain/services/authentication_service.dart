import 'package:dartz/dartz.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/helpers/network_call_managers.dart';
import '../../../../core/helpers/network_exceptions.dart';

class AuthenticationService{
  AuthenticationService({required this.apiClient});
  ApiClient apiClient;

  Future<Either<String,dynamic>> registerUser({required String email,required String password,required String firstName,
   required String lastName,required String phoneNumber,required bool isAgent}) async {
    try{
      final response = await apiClient.authPost(
      url: AppEndpoints.registerUsers, 
      data: {
    "email": email,
   "password": password,
   
    });
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        return Left(ex);
    }
   }

   Future<Either<String,dynamic>> loginUser({required String email,required String password}) async {
    try{
      final response = await apiClient.authPost(
      url: AppEndpoints.loginUsers, 
      data: {
    "username": email,
    "password": password,
    });
    print("log in $response");
    return Right(response);
    }catch(e){
        final ex = NetworkExceptions.getDioException(e);
        return Left(ex);
    }
   }
}