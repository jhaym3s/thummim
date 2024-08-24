part of 'my_courses_bloc.dart';

sealed class MyCoursesEvent extends Equatable {
  const MyCoursesEvent();

 
}

class GetLearnedCourse extends MyCoursesEvent{
  final String filter;
  GetLearnedCourse({required this.filter});
   @override
  List<Object?> get props => [filter];
}
