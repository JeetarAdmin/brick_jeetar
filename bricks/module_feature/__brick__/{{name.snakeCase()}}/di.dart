void setup{{name.pascalCase()}}(GetIt ioc){
  ioc.registerSingleton<{{name.pascalCase()}}Cubit>({{name.pascalCase()}}Cubit(
    apiService: {{name.pascalCase()}}ApiService(
      http: HttpService(baseUrl: AppURL.baseUrl),
    ),
  ));
}