import 'package:flutter/material.dart';
import 'package:smart_nepal/routes/app_router.dart';
import 'package:provider/provider.dart';
import 'package:smart_nepal/features/dashboard/view_model/dashboard_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DashboardViewModel())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
      ),
    );
  }
}
