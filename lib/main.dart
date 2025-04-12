import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_nepal/core/utils/app_context.dart';
import 'package:smart_nepal/features/dashboard/components/home/view_model/calculator_view_model.dart';
import 'package:smart_nepal/routes/app_router.dart';

// flutter clean;flutter pub get;flutter build web --release;firebase deploy --only hosting
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorViewModel()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        builder: (context, child) {
          AppContext().setContext(context);
          return child!;
        },
      ),
    );
  }
}
