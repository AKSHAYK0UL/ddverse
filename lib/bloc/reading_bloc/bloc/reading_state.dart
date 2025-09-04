part of 'reading_bloc.dart';

sealed class ReadingState {}

final class ReadingInitial extends ReadingState {}

final class ReadingLoadingState extends ReadingState {}

final class ReadingErrorState extends ReadingState {
  final String errorMessage;

  ReadingErrorState({required this.errorMessage});
}

final class ReadingDataState extends ReadingState {
  final Stream<List<TestReading>> data;

  ReadingDataState({required this.data});
}
