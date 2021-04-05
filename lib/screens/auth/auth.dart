import 'package:auth_module_flutter/screens/form/custom_button.dart';
import 'package:auth_module_flutter/screens/form/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
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
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            placeholder: 'Password',
          ),
          CustomButton(
            label: "Sign In",
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
