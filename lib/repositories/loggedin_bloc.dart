import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoggedEvent {}

class ChangeUser extends LoggedEvent {
  final String id;
  ChangeUser(this.id);
}

getUser() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  return user.email.toString();
}

class LoggedBloc extends Bloc<LoggedEvent, String> {
  @override
  String get initialState => getUser() ;

  @override
  void onTransition(Transition<LoggedEvent, String> transition) {
    print(transition);
  }

  @override
  Stream<String> mapEventToState(
    LoggedEvent event,
  ) async* {
    if (event is ChangeUser) yield event.id;
  }
}
