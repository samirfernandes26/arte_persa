import 'package:arte_persa/src/app_navigator_key.dart';
import 'package:arte_persa/src/app_theme.dart';
import 'package:arte_persa/src/shared/infra/routes/route_generator.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      builder: (AsyncNavigatorObserver asyncNavigatorObserver) {
        return MaterialApp(
          debugShowCheckedModeBanner: kDebugMode,
          title: "arte persa",
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            // Locale('en'),
            Locale('pt', 'BR'),
          ],
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          navigatorKey: AppNavigatorKey.instance.navKey,
          navigatorObservers: [asyncNavigatorObserver],
          initialRoute: RouteGeneratorKeys.path,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
