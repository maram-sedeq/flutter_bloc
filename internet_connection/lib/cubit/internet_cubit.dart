import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _subscription;
  InternetCubit() : super(InternetInitial());
  
void connected(){
  emit(ConnectedState(message: "Connected"));
}
void notconnected(){
   emit(NotConnectedState(message: "Not Connected"));
}


  void checkConnection(){ 
 _subscription= Connectivity()
    .onConnectivityChanged
    .listen( (List<ConnectivityResult> result)  {
      if(result.contains(ConnectivityResult.wifi ) || 
         result.contains(ConnectivityResult.ethernet)){
       connected();
      }
      else{
       notconnected();
      }
      
    });
}

 Future<void> _checkInitialConnection() async {
    final result = await Connectivity().checkConnectivity();

    print('Initial Connection: $result');

    if (result.contains(ConnectivityResult.none)) {
      notconnected();
    } else {
    connected();
    }
  }

@override
  Future<void> close() {
   _subscription!.cancel();
    return super.close();
  }
}


