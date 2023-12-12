class AuthUser {
  final String id;
  final String name;
  final String cpf;
  final String acessToken;
  final Set<String> roles;

  AuthUser({
    required this.id,
    required this.name,
    required this.cpf,
    required this.acessToken,
    required this.roles,
  });

  List<Object> get props => [
        id,
        name,
        cpf,
        acessToken,
        roles,
      ];
}
