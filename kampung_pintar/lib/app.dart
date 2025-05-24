import 'package:flutter/material.dart';
import 'presentation/routes/app_routes.dart';

class KampungPintAR extends StatelessWidget {
  const KampungPintAR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kampung PintAR',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: '/admin/home',
    );
  }
}
