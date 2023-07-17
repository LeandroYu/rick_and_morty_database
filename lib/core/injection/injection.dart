import 'package:get_it/get_it.dart';

import '../../business/store/character_store.dart';
import '../../view/home/store/home_store.dart';
import '../../view/splash/store/splash_store.dart';

class Injection {
  void inject() {
    GetIt.I.registerSingleton<HomeStore>(HomeStore());
    GetIt.I.registerSingleton<SplashStore>(SplashStore());
    GetIt.I.registerSingleton<CharacterStore>(CharacterStore());
  }
}
