part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUsers extends UserEvent {
  final User users;
  final BuildContext context;
  const AddUsers({
    required this.users,
    required this.context,
  });
  @override
  List<Object> get props => [users];
}

class FetchUsersInfo extends UserEvent {}

class UpdateUsers extends UserEvent {
  final User users;
  const UpdateUsers({
    required this.users,
  });
  @override
  List<Object> get props => [users];
}

class DeleteUsers extends UserEvent {
  final User users;
  const DeleteUsers({
    required this.users,
  });
  @override
  List<Object> get props => [users];
}

class LoginUser extends UserEvent {
  final String email;
  final String password;

  const LoginUser({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
