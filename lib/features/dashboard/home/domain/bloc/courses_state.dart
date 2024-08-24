part of 'courses_bloc.dart';

sealed class CoursesState extends Equatable {
  const CoursesState();
  
}

final class CoursesInitial extends CoursesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


final class GetAllCoursesSuccessState extends CoursesState {
  final List<dynamic> courses;

GetAllCoursesSuccessState({required this.courses});
  
  @override
  List<Object?> get props => [];
}

final class GetAllCoursesLoadingState extends CoursesState {
  @override
  List<Object?> get props => [];
}

final class GetAllCoursesFailureState extends CoursesState {
  final String errorMessage ;
  GetAllCoursesFailureState({required this.errorMessage});
  @override
  List<Object?> get props => [];
}
