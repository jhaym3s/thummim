part of 'courses_bloc.dart';

sealed class CoursesEvent extends Equatable {
  const CoursesEvent();

 
}

class GetAllCourses extends CoursesEvent{
  @override
  List<Object?> get props => [];
}

class EnrollCourse extends CoursesEvent{
  final int courseId;
  const EnrollCourse({required this.courseId});
   @override
  List<Object?> get props => [];
}
