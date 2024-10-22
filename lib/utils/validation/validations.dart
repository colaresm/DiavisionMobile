String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira o e-mail';
  }

  String pattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Por favor, insira um e-mail válido';
  }
  return null;
}

String? defaultValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }

  if (value.length > 32) {
    return 'O tamanho máximo desse campo deve ser de 25 caracteres';
  }
  return null;
}
