import 'package:dicebear_avatars/screens/home_screen.dart';
import 'package:dicebear_avatars/screens/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashScreen()),
        ChildRoute('/home', child: (context, args) => const HomeScreen())
      ];
}
