import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/param/base_param.dart';
import 'package:farm_scheduling/core/services/session_manager.dart';


import '../mediators/communication_types/AppStatus.dart';
import '../param/no_param.dart';
import '../services/init_app_store.dart';
import 'base_use_case.dart';

class CheckFirstInitUseCase extends UseCase<Future<bool>, NoParams> {

  final InitAppStore initAppStore;

  CheckFirstInitUseCase(this.initAppStore);

  @override
  Future<bool> call(NoParams params) async {
    return await initAppStore.isFirstTime;
  }
}

class SetFirstTimeUseCase extends UseCase<void, NoParams> {

  final InitAppStore initAppStore;

  SetFirstTimeUseCase(this.initAppStore);

  @override
  void call(NoParams params) {
    initAppStore.setFirstTime();
  }
}

class CheckLoginUseCase extends UseCase<Future<Status>, NoParams> {

  final SessionManager sessionManager=locator<SessionManager>();

//  CheckLoginUseCase(this.sessionManager);

  @override
  Future<Status> call(NoParams params) async {
   final res= await  sessionManager.hasToken;
   if(res)
     {
       return Status.authorized;
     }
   else
     {
       return Status.unauthorized;
     }
  }
}
