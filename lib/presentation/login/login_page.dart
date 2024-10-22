import 'package:diavision/core/routes/routes.dart';
import 'package:diavision/presentation/widgets/default_button/default_button.dart';
import 'package:diavision/presentation/widgets/default_text_field/default_text_field.dart';
import 'package:diavision/utils/validation/validations.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.15,
                ),
                Image.asset(
                  'assets/images/diavision.png',
                  height: constraints.maxHeight * 0.3,
                  width: constraints.maxWidth * 0.8,
                ),
                DefaultTextField(
                  validator: validateEmail,
                  controller: _emailController,
                  label: "Email",
                ),
                const SizedBox(height: 16),
                DefaultTextField(
                  validator: defaultValidation,
                  controller: _passwordController,
                  label: "Senha",
                  isPassword: true,
                ),
                const SizedBox(height: 22),
                DefaultButton(
                  minWidth: constraints.minWidth,
                  label: "Login",
                  onPressed: () {
                    _formKey.currentState!.validate() ? print("teste") : null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Não tem conta? ",
                            style: TextStyle(color: Colors.grey)),
                        InkWell(
                          onTap: () => redirectToRegisterPatientPage(context),
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
