import 'package:atividade03_teste/model/movements_model.dart';
import 'package:atividade03_teste/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../provider/rest_provider_user.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    // on<UpdateRequest>((event, emit) {
    //   emit(UpdateState(noteId: event.noteId, previousNote: event.previousNote));
    // });

    // on<UpdateCancel>((event, emit) {
    //   emit(InsertState());
    // });

    on<SubmitEvent>((event, emit) {
      //if (state is InsertState) {
      //ToDo: Inserir uma chamada de insert
      RestDataProvider.helper.insertUser(event.user);
      /*} else if (state is UpdateState) {
        //ToDo: Inserir uma chamada de Update
        RestDataProvider.helper
            .updateNote((state as UpdateState).noteId, event.note);
        emit(InsertState());*/
    });

    on<SubmitEventMoviment>((event, emit) {
      RestDataProvider.helper.inserMoviment(event.moviment);
    });

    // on<DeleteEvent>((event, emit) {
    //   // ToDo: Inserir uma chamada de Delete

    //   RestDataProvider.helper.deleteNote(event.noteId);
    // });
  }
}

/*
  Eventos
*/
abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  UserModel user;
  SubmitEvent({required this.user});
}

class SubmitEventMoviment extends ManageEvent {
  MovimentModel moviment;
  SubmitEventMoviment({required this.moviment});
}

// class DeleteEvent extends ManageEvent {
//   String noteId;
//   DeleteEvent({required this.noteId});
// }

// class UpdateRequest extends ManageEvent {
//   String noteId;
//   Note previousNote;
//   UpdateRequest({required this.noteId, required this.previousNote});
// }

// class UpdateCancel extends ManageEvent {}

/*
Estados
*/

abstract class ManageState {}

class InsertState extends ManageState {}

// class UpdateState extends ManageState {
//   String noteId;
//   Note previousNote;
//   UpdateState({required this.noteId, required this.previousNote});
// }
