import 'package:bloc/bloc.dart';

enum LoggedEvent {
  triggerChange
}

class LoggedBloc extends Bloc<LoggedEvent, bool> {
  @override
  bool get initialState => true ;

  @override
  Stream<bool> mapEventToState(
    LoggedEvent event,
  ) async* {
    if(event == LoggedEvent.triggerChange) yield !state ;
  }
}