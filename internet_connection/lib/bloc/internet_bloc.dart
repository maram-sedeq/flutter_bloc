import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  InternetBloc() : super(InternetInitial()) {
    print('1. InternetBloc Created');

    on<InternetEvent>((event, emit) {
      print('3. Event Received: $event');

      if (event is ConnectedEvent) {
        emit(ConnectedState(message: "Connected"));
      } else if (event is NotConnectedEvent) {
        emit(NotConnectedState(message: "Not Connected"));
      }
    });

    _checkInitialConnection();


    // TODO: for mobile (not working on web)
    _subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      print('2. Connectivity Changed: $result');

      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.ethernet) ||
          result.contains(ConnectivityResult.mobile)) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }

  Future<void> _checkInitialConnection() async {
    final result = await Connectivity().checkConnectivity();

    print('Initial Connection: $result');

    if (result.contains(ConnectivityResult.none)) {
      add(NotConnectedEvent());
    } else {
      add(ConnectedEvent());
    }
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}
