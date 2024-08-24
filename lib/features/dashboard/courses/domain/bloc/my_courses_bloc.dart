import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thummim/features/dashboard/courses/domain/services/course_services.dart';

part 'my_courses_event.dart';
part 'my_courses_state.dart';

class MyCoursesBloc extends Bloc<MyCoursesEvent, MyCoursesState> {
  CourseService coursesService;
  MyCoursesBloc({required this.coursesService}) : super(MyCoursesInitial()) {
   on<GetLearnedCourse>(getLearnedCourse);
  }

FutureOr<void> getLearnedCourse(GetLearnedCourse event, Emitter<MyCoursesState> emit) async {
    emit(GetLearnedCoursesLoadingState());
    final user = await coursesService.getSectionedThimPressCourses(courseFilter: event.filter);
    user.fold((l) {
      print("error $l");
      emit(GetLearnedCoursesFailureState(errorMessage: l));
    }, 
    (r) {
      print("courses filtered $r");
      emit(GetLearnedCoursesSuccessState(courses: r));
    });
  }

}
