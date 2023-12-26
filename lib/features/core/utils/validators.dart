import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  /// Email Validator
  static final email = EmailValidator(errorText: 'Entre com um email válido');

  /// Name Validator
  static final name = MultiValidator([
    RequiredValidator(errorText: 'Campo obrigatório'),
    PatternValidator(r'(^[A-Z][a-z]+(?:\s[a-z]+)*$)',
        errorText: 'A primeira letra deve ser maiúscula')
  ]);

  /// Cpf Validator
  static final cpf = MultiValidator([
    RequiredValidator(errorText: 'Campo obrigatório'),
    PatternValidator(r'(^(\d{3}\.?\d{3}\.?\d{3}-?\d{2})$)',
        errorText: 'O Cpf está no formato inválido')
  ]);

  /// Password Validator
  static final password = MultiValidator([
    RequiredValidator(errorText: 'Password é obrigatório'),
    MinLengthValidator(8, errorText: 'A senha deve ter pelo menos 8 dígitos'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'A senha deve ter pelo menos um caractere especial')
  ]);

  /// Required Validator with Optional Field Name
  static RequiredValidator requiredWithFieldName(String? fieldName) =>
      RequiredValidator(errorText: '${fieldName ?? 'Field'} é obrigatório');

  /// Plain Required Validator
  static final required = RequiredValidator(errorText: 'Campo obrigatório');
}
