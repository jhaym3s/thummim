part of 'lessons_bloc.dart';

sealed class LessonsState extends Equatable {
  const LessonsState();
  
  
}

final class LessonsInitial extends LessonsState {
  @override
  List<Object> get props => [];
}

final class GetLessonsSuccessState extends LessonsState{
  final List<dynamic> lessons;
  const GetLessonsSuccessState({required this.lessons});
@override
  List<Object> get props => [lessons];
}


final class GetLessonsLoadingState extends LessonsState{
  @override
  List<Object> get props => [];
}

final class GetLessonsFailureState extends LessonsState{
  @override
  List<Object> get props => [];
}