import 'package:ddverse/model/reading.dart';
import 'package:ddverse/repository/bluetooth/bluetooth_repo.dart';
import 'package:ddverse/repository/database/databas_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  final BluetoothRepo _bluetoothRepo;
  final DatabaseRepo _databaseRepo;
  ReadingBloc(this._bluetoothRepo, this._databaseRepo)
    : super(ReadingInitial()) {
    on<TakeReadingEvent>(_takeReading);
    on<GetAllReportsEvent>(_getAllReports);
  }
  Future<void> _takeReading(
    TakeReadingEvent event,
    Emitter<ReadingState> emit,
  ) async {
    emit(ReadingLoadingState());
    try {
      final data = await _bluetoothRepo.newReading;
      await _databaseRepo.addData(data);
      add(GetAllReportsEvent());
    } catch (e) {
      emit(ReadingErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _getAllReports(
    GetAllReportsEvent event,
    Emitter<ReadingState> emit,
  ) async {
    emit(ReadingLoadingState());
    try {
      final data = _databaseRepo.getData();
      emit(ReadingDataState(data: data));
    } catch (e) {
      emit(ReadingErrorState(errorMessage: e.toString()));
    }
  }
}
