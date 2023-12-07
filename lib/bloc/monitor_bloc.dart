import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/users.dart';
import '../provider/rest_provider.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {


  UserCollection userCollection = UserCollection();

  MonitorBloc() : super(MonitorState(userCollection: UserCollection())) {
    RestDataProvider.helper.stream.listen((event) {
      String userId = event[0];

      if (event[1] == null) {
        // Ocorreu um delete
        userCollection.deleteUserOfId(userId);
      } else {
        userCollection.updateOrInsertUserOfId(userId, event[1]);
      }
      print("opa, update");
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      userCollection = await RestDataProvider.helper.getUsersList();
      emit(MonitorState(userCollection: userCollection));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(userCollection: userCollection));
    });
    add(AskNewList());
  }
}

/*
Eventos
*/
abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {}

/*
Estados
*/
class MonitorState {
  UserCollection userCollection;
  MonitorState({required this.userCollection});
}
