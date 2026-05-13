import 'package:arte_persa/src/app_navigator_key.dart';
import 'package:arte_persa/src/app_theme.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arte Persa',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      navigatorKey: AppNavigatorKey.instance.navKey,
      initialRoute: RouteGeneratorKeys.path,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
