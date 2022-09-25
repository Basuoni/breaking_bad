import 'package:bloc/bloc.dart';
import 'package:breaking_bad/app_router.dart';
import 'package:breaking_bad/shared/bloc_observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(BreakingBadApp(
    appRouter: AppRouter(),
  ));
}

class BreakingBadApp extends StatelessWidget {
  final AppRouter appRouter;
  const BreakingBadApp({super.key, required this.appRouter});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
