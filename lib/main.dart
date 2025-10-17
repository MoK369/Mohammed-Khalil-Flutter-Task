import 'package:flutter/material.dart';
import 'package:otex_flutter_task/data/dummy/dummy_data_provider.dart';
import 'package:otex_flutter_task/ui/core/di/di.dart';
import 'package:otex_flutter_task/ui/core/l10n/app_localizations.dart';
import 'package:otex_flutter_task/ui/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await getIt.get<DummyDataProvider>().insertDummyData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Otex App Test',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomeScreen(),
    );
  }
}