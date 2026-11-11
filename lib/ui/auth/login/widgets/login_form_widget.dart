import 'package:curso_mvvm_youtube/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  final LoginViewmodel loginViewmodel;
  const LoginFormWidget({super.key, required this.loginViewmodel});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16,
        children: [
          Column(
            children: [
              Row(children: [Text("Usuario")]),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "por favor, digite o usuario";
                  }
                  return null;
                },
                controller: usernameController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
          Column(
            children: [
              Row(children: [Text("Email")]),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "por favor, digite o email";
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            onPressed: _validateForm,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState?.validate() == true) {
      final username = usernameController.text;
      final password = passwordController.text;
      widget.loginViewmodel.login((username, password));
    }
  }
}
