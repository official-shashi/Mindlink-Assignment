import 'package:get/get.dart';
import 'package:mindlink_assignment/views/home_view.dart';
import 'initial_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: InitialBinding(), // Binding yahan add karenge
    ),
    // Add more routes here
  ];
}
