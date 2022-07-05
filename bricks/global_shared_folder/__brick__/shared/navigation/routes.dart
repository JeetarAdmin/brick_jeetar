
// ignore: prefer_function_declarations_over_variables
var routes = (RouteSettings settings) {
  switch (settings.name) {
    case RootRoutes.initial:
      return FadeRoute(
        page: const SplashScreen(),
      );
    case RootRoutes.home:
      return SlideUpRoute(page: const RootWidget());

    case HomeRoutes.viewStores:
      return SlideUpRoute(page: const Store());
  }

  return null;
};
