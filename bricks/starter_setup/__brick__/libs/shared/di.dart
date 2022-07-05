import 'package:get_it/get_it.dart';
import 'analytics/analytics_service.dart';
import 'navigation/navigation_service.dart';

setupSharedServices(GetIt ioc) {
  ioc.registerSingleton<NavigationService>(NavigationService());
  ioc.registerSingleton<AnalyticService>(AnalyticService());
}
