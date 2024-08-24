import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thummim/features/dashboard/courses/domain/services/lesson_service.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final LessonService lessonService;
  LessonsBloc({required this.lessonService}) : super(LessonsInitial()) {
    on<GetLessonsEvent>(getLessons);
  }

  FutureOr<void> getLessons(GetLessonsEvent event, Emitter<LessonsState> emit)  async {
     emit(GetLessonsLoadingState());
    final user = await lessonService.getLessonsById(courseId: event.courseId);
    user.fold((l) {
      print("error $l");
      emit(GetLessonsFailureState());
    }, 
    (r) {
      print("lessons $r");
      emit(GetLessonsSuccessState(lessons: r));
    });
  }
}
