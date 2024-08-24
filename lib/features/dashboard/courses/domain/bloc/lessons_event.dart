part of 'lessons_bloc.dart';

sealed class LessonsEvent extends Equatable {
  const LessonsEvent();
}

class GetLessonsEvent extends LessonsEvent{
    final int courseId;

    GetLessonsEvent({required this.courseId});
    @override
  List<Object> get props => [courseId];
}
