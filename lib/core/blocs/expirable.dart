import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/error/http/forbidden_error.dart';
import 'package:farm_scheduling/core/result/result.dart';

// abstract class Expirable {
//   void expire(Result result) {
//     if (result.hasErrorOnly && result.error is ForbiddenError) {
//       locator<AuthBloc>().logout();
//     }
//     return;
//   }
// }
