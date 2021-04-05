import 'package:auth_module_flutter/screens/auth/bloc/auth_cubit.dart';
import 'package:auth_module_flutter/screens/form/custom_button.dart';
import 'package:auth_module_flutter/screens/form/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  String _username;
  String _password;

  @override
  void initState() {
    _usernameController = TextEditingController()
      ..addListener(_usernameListener);
    _passwordController = TextEditingController()
      ..addListener(_passwordListener);
    super.initState();
  }

  _usernameListener() {
    final _updatedText = _usernameController.text.trim();
    if (_updatedText != _username) {
      setState(() {
        _username = _updatedText;
      });
    }
  }

  _passwordListener() {
    final _updatedText = _passwordController.text.trim();
    if (_updatedText != _password) {
      setState(() {
        _password = _updatedText;
      });
    }
  }

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  _authListeners(context, AuthState state) {
    if (state.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.error),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: _authListeners,
        listenWhen: (c, state) => state.hasError,
        child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                    )),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  placeholder: 'Username',
                  controller: _usernameController,
                  enabled: !state.loading,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  placeholder: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  enabled: !state.loading,
                ),
                CustomButton(
                  label: "Sign In",
                  disabled: !_validate() || state.loading,
                  onPressed: () => _submit(context),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          );
        }),
      ),
    );
  }

  _submit(BuildContext context) {
    context.read<AuthCubit>().login(_username, _password);
  }

  _validateUsername() {
    return _username != null && _username.isNotEmpty;
  }

  _validatePassword() {
    return _password != null && _password.isNotEmpty;
  }

  _validate() {
    return _validateUsername() && _validatePassword();
  }
}
