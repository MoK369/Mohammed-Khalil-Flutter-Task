import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/di/di.dart';
import 'package:otex_flutter_task/core/l10n/app_localizations.dart';
import 'package:otex_flutter_task/core/routing/route_methods.dart';
import 'package:otex_flutter_task/core/theme/app_theme.dart';
//import 'package:otex_flutter_task/data/dummy/dummy_data_provider.dart';
import 'package:otex_flutter_task/ui/home/home_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  //await getIt.get<DummyDataProvider>().insertDummyData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otex App Test',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      locale: const Locale("ar"),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RouteMethods.getRoute,
      home: const HomeScreen(),
    );
  }
}
