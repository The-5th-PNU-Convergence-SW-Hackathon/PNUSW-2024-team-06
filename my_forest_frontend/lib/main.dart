import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'common/const/colors.dart';
import 'common/provider/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColor.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // intl 패키지의 initializeDateFormatting 함수를 비동기적으로 호출
  // 다양한 언어와 지역 설정에 맞는 날짜 형식 데이터를 초기화
  await initializeDateFormatting();

  // 가로 모드 제한
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // riverpod 설정
  runApp(
    ProviderScope(
      observers: [],
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // go_router 를 지정하기 위함
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // global theme
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // language
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ko', ''), // Korean, no country code
      ],
      // 글자 크기 제한
      builder: (context, child) {
        double myTextScaleFacto = 1.1;

        if (MediaQuery.of(context).textScaleFactor >= 1.4) {
          myTextScaleFacto = 1.4;
        }

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(myTextScaleFacto),
          ),
          child: child!,
          // child: child,
        );
      },
      // router 적용
      routerConfig: router,
    );
  }
}
