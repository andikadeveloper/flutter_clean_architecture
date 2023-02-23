import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/pages/cubit/user_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'presentation/pages/home_page.dart';
import 'di/locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<UserCubit>(
        create: (context) => UserCubit(getUsers: di.locator.get()),
        child: const HomePage(),
      ),
    );
  }
}
