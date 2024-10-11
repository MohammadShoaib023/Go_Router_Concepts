import 'package:concepts_go_router/src/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../router/router.dart';
import '../../domain/use_case/auth_use_case.dart';
import '../blocs/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const String title = 'GoRouter Example: Redirection';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthUseCase(AuthRepository())),
      child: MaterialApp.router(
        routerConfig: router,
        title: title,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
