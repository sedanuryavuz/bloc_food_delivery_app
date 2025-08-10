abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  RegisterEvent(this.name, this.email, this.password);
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}
