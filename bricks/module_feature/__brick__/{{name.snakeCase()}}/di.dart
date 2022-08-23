import 'package:get_it/get_it.dart';
import './services/api_service.dart';
import 'package:{{package_name}}/shared/network/network_request.dart';
import 'cubit/{{name.snakeCase()}}_cubit.dart';
import 'package:{{package_name}}/configs/app_configs.dart';


void setup{{name.pascalCase()}}(GetIt ioc){
  ioc.registerSingleton<{{name.pascalCase()}}Cubit>({{name.pascalCase()}}Cubit(
    apiService: {{name.pascalCase()}}ApiService(
      http: HttpService(baseUrl: AppURL.baseUrl),
    ),
  ));
}