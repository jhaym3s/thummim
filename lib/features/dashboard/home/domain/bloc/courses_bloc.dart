import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thummim/core/configs/storage_box.dart';
import 'package:thummim/core/helpers/hive_repository.dart';

import '../../../courses/domain/services/course_services.dart';
import '../modal/courses.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CourseService coursesService;
  final HiveRepository _hiveRepository = HiveRepository();
  CoursesBloc({required this.coursesService}) : super(CoursesInitial()) {
    on<GetAllCourses>(getAllCourses);
    on<EnrollCourse>(enrollCourse);
  }

  FutureOr<void> getAllCourses(GetAllCourses event, Emitter<CoursesState> emit) async {
    emit(GetAllCoursesLoadingState());
    final allCourses = await coursesService.getAllCourses();
    final thimPressCourses = await coursesService.getAllThimPressCourses();
    print("thim press $thimPressCourses");
    thimPressCourses.fold((l) => emit(GetAllCoursesFailureState(errorMessage: l)), 
    (r) {
      print("courses $r");
      final  courseList = (r as List);
      print("courses $courseList");
      final courses = courseList.map((e) => Courses.fromJson(e)).toList();
      _hiveRepository.add<List<Courses>>(item: courses, name: HiveKeys.courses,key: HiveKeys.courses);
      emit(GetAllCoursesSuccessState(courses: courses));
    });
  }


  FutureOr<void> enrollCourse(EnrollCourse event, Emitter<CoursesState> emit) async{
    emit(EnrollCoursesLoadingState());
    final enroll = await coursesService.enrollForCourse(courseId: event.courseId);
    enroll.fold((l) => emit(EnrollCourseFailureState(errorMessage: l)), 
    (r) {
      print("enroll $r");
      emit(const EnrollCourseSuccessState());
    });
  }
}
