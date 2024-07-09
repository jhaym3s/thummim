import 'package:dartz/dartz.dart';

import '../../../../core/api/endpoints.dart';
import '../../../../core/helpers/network_call_managers.dart';
import '../../../../core/helpers/network_exceptions.dart';

class AuthenticationService{
  AuthenticationService({required this.apiClient});
  ApiClient apiClient;

  Future<Either<String,dynamic>> registerUser({
    required String email,
  required String password,
  required String firstName,
   required String lastName,
   required String country,
   required String userName,
   required String phoneNumber}) async {
    try{
      final response = await apiClient.authPost(
      url: AppEndpoints.registerUsers, 
      data: {
    "username": userName,
    "email": email,
    "password": password,
    "first_name": firstName,
    "last_name": lastName,
    "country": country,
    "phone_number": phoneNumber
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
    "login": email,
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