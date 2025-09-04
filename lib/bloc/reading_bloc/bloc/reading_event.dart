part of 'reading_bloc.dart';

sealed class ReadingEvent {}

final class TakeReadingEvent extends ReadingEvent {}

final class GetAllReportsEvent extends ReadingEvent {}
