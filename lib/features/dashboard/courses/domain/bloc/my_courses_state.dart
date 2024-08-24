part of 'my_courses_bloc.dart';

sealed class MyCoursesState extends Equatable {
  const MyCoursesState();
  

}

final class MyCoursesInitial extends MyCoursesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


final class GetLearnedCoursesSuccessState extends MyCoursesState {
  final List<dynamic> courses;

GetLearnedCoursesSuccessState({required this.courses});
  
  @override
  List<Object?> get props => [];
}

final class GetLearnedCoursesLoadingState extends MyCoursesState {
  @override
  List<Object?> get props => [];
}

final class GetLearnedCoursesFailureState extends MyCoursesState {
  final String errorMessage ;
  GetLearnedCoursesFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [];
}

