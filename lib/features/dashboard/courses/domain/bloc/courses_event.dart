part of 'courses_bloc.dart';

sealed class CoursesEvent extends Equatable {
  
}

class GetAllCourses extends CoursesEvent{
  @override
  List<Object?> get props => [];

}

class GetCourseById extends CoursesEvent{
  final int courseId;
  GetCourseById({required this.courseId});
   @override
  List<Object?> get props => [courseId];
}
