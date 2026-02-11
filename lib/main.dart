import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/video/repos/playback_config_repo.dart';
import 'package:tiktok_clone/features/video/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  final preferences = await SharedPreferences.getInstance();
  final repository = PlaybackConfigRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlaybackConfigViewModel(repository),
        ),
      ],
      child: TiktokApp(),
    ),
  );
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'TiktokApp',
      // locale: Locale("en"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"), Locale("ko"), Locale("es")],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: Typography.blackMountainView,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFE9435A),
          onPrimary: Colors.white,
          secondary: Color(0xFF0066FF),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
          selectionColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        indicatorColor: Colors.black,
        listTileTheme: ListTileThemeData(iconColor: Colors.black),
      ),
      darkTheme: ThemeData(
        indicatorColor: Colors.white,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        textTheme: Typography.whiteMountainView,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFE9435A),
          onPrimary: Colors.white,
          secondary: Color(0xFF0066FF),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
          selectionColor: Color(0xFFE9435A),
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.grey.shade900,
          backgroundColor: Colors.grey.shade900,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
          actionsIconTheme: IconThemeData(color: Colors.grey.shade100),
          iconTheme: IconThemeData(color: Colors.grey.shade100),
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey.shade900),
      ),
    );
  }
}
