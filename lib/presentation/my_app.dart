import 'package:basic_form/data/repository_impl/user_repository_impl.dart';
import 'package:basic_form/presentation/blocs/add_form_data_bloc.dart';
import 'package:basic_form/presentation/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Form App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AddFormBloc>(
            create: (context) => AddFormBloc(UserRepositoryImpl()),
          ),
          // You can add more BlocProviders here if needed
        ],
        child: HomeScreen(),
      ),
    );
  }
}
