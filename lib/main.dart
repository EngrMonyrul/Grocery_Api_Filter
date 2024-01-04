import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplegrocery/helper/navigation.dart';
import 'package:simplegrocery/src/view/home/home_page_view.dart';
import 'package:simplegrocery/src/viewmodel/providers/home_page_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
            create: (_) => HomePageProvider(NavigationHelper.instance)),
      ],
      child: MaterialApp(
        navigatorKey: NavigationHelper.instance.navigationKey,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: const HomePageView(),
        theme: ThemeData(
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
      ),
    );
  }
}
