import 'package:diavision/presentation/widgets/body/body.dart';
import 'package:diavision/presentation/widgets/datepicker/custom_datepicker.dart';
import 'package:diavision/presentation/widgets/default_button/default_button.dart';
import 'package:diavision/presentation/widgets/default_text_field/default_text_field.dart';
import 'package:diavision/utils/validation/validations.dart';
import 'package:flutter/material.dart';

class RegisterPatientPage extends StatefulWidget {
  const RegisterPatientPage({super.key});

  @override
  State<RegisterPatientPage> createState() => _RegisterPatientPageState();
}

class _RegisterPatientPageState extends State<RegisterPatientPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Body(
      onRefresh: () {
        print("sss");
      },
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                DefaultTextField(
                  label: "Nome",
                  controller: _nameController,
                  validator: defaultValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextField(
                  label: "Telefone",
                  controller: _phoneController,
                  validator: defaultValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextField(
                  label: "Email",
                  controller: _emailController,
                  validator: defaultValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomDatePicker(dateController: _dateController),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      const Text("Possui diabetes?"),
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: DefaultButton(
                      minWidth: constraints.maxWidth,
                      label: "cadastrar",
                      onPressed: () {}),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
