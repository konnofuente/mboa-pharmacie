import 'package:equatable/equatable.dart';
import '../../../models/User.dart';

class UserState extends Equatable {
  final User? appUser;
  final List<User> usersList; // Add this line
  
  const UserState({this.appUser, this.usersList = const []}); // Update this line

  @override
  List<Object?> get props => [appUser, usersList]; // Update this line
}


