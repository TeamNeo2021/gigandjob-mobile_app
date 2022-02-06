import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detallesoferta_event.dart';
part 'detallesoferta_state.dart';

class DetallesofertaBloc extends Bloc<DetallesofertaEvent, DetallesofertaState> {
  DetallesofertaBloc() : super(DetallesofertaInitial()) {
    on<DetallesofertaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
