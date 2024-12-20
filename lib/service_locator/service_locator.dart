import 'package:get_it/get_it.dart';
import 'package:public_chat/_shared/translate/translate_text.dart';
import 'package:public_chat/_shared/translate/translate_text_impl.dart';
import 'package:public_chat/repository/database.dart';
import 'package:public_chat/repository/genai_model.dart';

class ServiceLocator {
  static ServiceLocator instance = ServiceLocator._();

  final GetIt _getIt = GetIt.asNewInstance();

  ServiceLocator._();

  void initialise() {
    registerSingletonIfNeeded(GenAiModel());
    registerSingletonIfNeeded(Database.instance);
    registerSingletonIfNeeded<TranslateText>(TranslateTextImpl());
  }

  void registerSingletonIfNeeded<T extends Object>(T instance) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingleton<T>(instance);
    }
  }

  void reset() => _getIt.reset();

  T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
