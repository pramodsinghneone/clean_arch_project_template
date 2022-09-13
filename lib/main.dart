import 'package:clean_arch_project_template/di.dart';
import 'package:clean_arch_project_template/feature/core/generate_route.dart';
import 'package:clean_arch_project_template/feature/presentation/cubits/cubit/users_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di<UsersDetailsCubit>()),
      ],
      child: MaterialApp(
        title: 'Clean Arch Template',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: OnGenerateRoute.route,
      ),
    );
  }
}
