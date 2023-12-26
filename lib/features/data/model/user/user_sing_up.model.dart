class UserSingUpModel {
  final String firstName;
  final String lastName;
  final String cpf;
  final String email;
  final String password;

  UserSingUpModel({
    required this.firstName,
    required this.lastName,
    required this.cpf,
    required this.email,
    required this.password,
  });

  factory UserSingUpModel.fromModel(Map<String, dynamic> user) {
    return UserSingUpModel(
        firstName: user['firstName'],
        lastName: user['lastName'],
        cpf: user['cpf'],
        email: user['email'],
        password: user['password']);
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'cpf': cpf,
        'email': email,
        'password': password,
      };
}
