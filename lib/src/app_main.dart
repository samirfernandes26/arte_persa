import 'package:arte_persa/src/core/ui/app_nav_global_key.dart';
import 'package:arte_persa/src/core/ui/app_theme.dart';
import 'package:arte_persa/src/routes/route_generator.dart';
import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppMain extends StatelessWidget{
  const AppMain({super.key});
  
  @override
  Widget build(BuildContext context){
    return AsyncStateBuilder(
      enableLog: false,
      // customLoader: const AppLoader(),
      builder:(asyncNavigatorObserver){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Arte Persa',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('pt', 'BR'),
          ],
          theme: AppTheme.themeData,
          navigatorKey: AppNavGlobalKey.instance.navKey,
          navigatorObservers: [asyncNavigatorObserver],
          // initialRoute: RouteGeneratorKeys.path,
          initialRoute: RouteGeneratorKeys.cadastroServico,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      }
    );
  }
}