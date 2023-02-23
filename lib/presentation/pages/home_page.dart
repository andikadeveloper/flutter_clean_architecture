import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/pages/cubit/user_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<UserCubit>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Clean Architecture'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserError) {
            final message = state.failure.message;

            return Center(child: Text(message));
          }

          if (state is UserSuccess) {
            final users = state.users;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                final fullName = user.firstName + ' ' + user.lastName;

                return ListTile(
                  title: Text(fullName),
                  subtitle: Text(user.email),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
