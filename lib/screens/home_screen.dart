import 'package:authentication_flutter_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:authentication_flutter_bloc/cubits/auth_cubit/auth_state.dart';
import 'package:authentication_flutter_bloc/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Container(
          child: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
              if(state is AuthLoggedOutState) {
                 Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>  SignInScreen()));
              }
          },
          builder: (context, state) {
            return CupertinoButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();
              },
              child: const Text("Log Out"),
            );
          },
        ),
      )),
    );
  }
}
