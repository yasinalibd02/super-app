import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/language/data/datasource/language_local_datasource.dart';
import '../../features/language/data/repository/language_repository_impl.dart';
import '../../features/language/domain/repository/language_repository.dart';
import '../../features/language/domain/usecase/change_language_usecase.dart';
import '../../features/language/domain/usecase/get_language_usecase.dart';
import '../../features/language/presentation/bloc/language_bloc.dart';
import '../../features/stripe_payment/data/repository/payment_repository_impl.dart';
import '../../features/stripe_payment/domain/repository/payment_repository.dart';
import '../../features/stripe_payment/domain/usecase/payment_usecases.dart';
import '../../features/stripe_payment/presentation/bloc/payment_bloc.dart';

import '../../features/stories/data/repository/story_repository_impl.dart';
import '../../features/stories/domain/repository/story_repository.dart';
import '../../features/stories/presentation/bloc/story_bloc.dart';
import '../../features/swipe_payment/data/repository/swipe_repository.dart';
import '../../features/swipe_payment/presentation/bloc/swipe_bloc.dart';

import '../../features/smart_otp/data/repository/otp_repository.dart';
import '../../features/smart_otp/presentation/bloc/otp_bloc.dart';

import '../../features/double_tap_like/data/repository/like_repository.dart';
import '../../features/double_tap_like/presentation/bloc/like_bloc.dart';

import '../../features/hold_record/data/repository/record_repository.dart';
import '../../features/hold_record/presentation/bloc/record_bloc.dart';

import '../../features/confetti/data/repository/success_repository.dart';
import '../../features/confetti/presentation/bloc/success_bloc.dart';
import '../../features/voice_search/data/repository/voice_repository_impl.dart';
import '../../features/voice_search/domain/repository/voice_repository.dart';
import '../../features/voice_search/domain/usecase/voice_usecases.dart';
import '../../features/voice_search/presentation/bloc/voice_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Data Source
  sl.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Repository
  sl.registerLazySingleton<LanguageRepository>(
    () => LanguageRepositoryImpl(localDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetLanguageUseCase(sl()));
  sl.registerLazySingleton(() => ChangeLanguageUseCase(sl()));

  // BLoC
  sl.registerFactory(
    () => LanguageBloc(getLanguageUseCase: sl(), changeLanguageUseCase: sl()),
  );

  // --- Voice Search ---
  final speechToText = SpeechToText();
  sl.registerLazySingleton(() => speechToText);
  sl.registerLazySingleton<VoiceRepository>(() => VoiceRepositoryImpl(sl()));
  sl.registerLazySingleton(() => InitVoiceUseCase(sl()));
  sl.registerLazySingleton(() => StartListeningUseCase(sl()));
  sl.registerLazySingleton(() => StopListeningUseCase(sl()));
  sl.registerFactory(
    () => VoiceBloc(initVoice: sl(), startListening: sl(), stopListening: sl()),
  );

  // --- Stripe Payment ---
  sl.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl());
  sl.registerLazySingleton(() => CreatePaymentIntentUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmPaymentUseCase(sl()));
  sl.registerFactory(
    () => PaymentBloc(createPaymentIntent: sl(), confirmPayment: sl()),
  );

  // --- Stories ---
  sl.registerLazySingleton<StoryRepository>(() => StoryRepositoryImpl());
  sl.registerFactory(() => StoryBloc(repository: sl()));

  // --- Swipe Payment ---
  sl.registerLazySingleton<SwipeRepository>(() => SwipeRepositoryImpl());
  sl.registerFactory(() => SwipeBloc(repository: sl()));

  // --- Smart OTP ---
  sl.registerLazySingleton<OtpRepository>(() => OtpRepositoryImpl());
  sl.registerFactory(() => OtpBloc(repository: sl()));

  // --- Double Tap Like ---
  sl.registerLazySingleton<LikeRepository>(() => LikeRepositoryImpl());
  sl.registerFactory(() => LikeBloc(repository: sl()));

  // --- Hold Record ---
  sl.registerLazySingleton<RecordRepository>(() => RecordRepositoryImpl());
  sl.registerFactory(() => RecordBloc(repository: sl()));

  // --- Success Confetti ---
  sl.registerLazySingleton<SuccessRepository>(() => SuccessRepositoryImpl());
  sl.registerFactory(() => SuccessBloc(repository: sl()));
}
