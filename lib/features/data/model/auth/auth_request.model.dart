class AuthRequest {
  final String cpf;
  final String password;

  AuthRequest(this.cpf, this.password);

  Map<String, dynamic> toJson() => {
        'cpf': cpf,
        'password': password,
      };
}
