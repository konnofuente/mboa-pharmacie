import 'dart:async';
import 'dart:convert';
import 'user_state.dart';
import '../../../models/User.dart';
import '../../services/callApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import '../../utils/navigate_screen.dart';
import '../../widget/widget_alertbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mboa_pharmacie/models/function.dart';
import '../../screens/Home/GetStarted/getStarted_screen.dart';
import 'package:mboa_pharmacie/resources/local_storage_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<AddUsers>(_onAddUser);
    on<UpdateUsers>(_onUpdateUser);
    on<DeleteUsers>(_onDeleteUser);
    on<FetchUsersInfo>(_onFetchUserInfo);
    on<LoginUser>(_onLoginUser);
  }

  final loginStatusController = StreamController<bool>.broadcast();
  final _storage = const FlutterSecureStorage();

  Future<FutureOr<void>> _onFetchUserInfo(
      FetchUsersInfo event, Emitter<UserState> emit) async {
    final state = this.state;
    final response = await CallApi().getDataWithID('users', 1);

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = jsonDecode(response.body);
      emit(UserState(appUser: User.fromMap(userData)));
      print("successfull fetch of all User!!!!!!");
      print(state.appUser);
    } else {
      throw Exception('Failed to load Users');
    }
  }

  bool doesUserExist(String email, List<User> usersList) {
    return usersList.any((user) => user.email == email);
  }

  Future<FutureOr<void>> _onAddUser(
      AddUsers event, Emitter<UserState> emit) async {
    final state = this.state;
    if (doesUserExist(event.users.email!, state.usersList)) {
      AlertBox.alertbox(event.context, "Registration",
          "Cette utilisateur existe deja", () {});
      print('uuser already existe');
    } else {
      // generate the user ID using email
      int userId = AppFunction().generateUserId(event.users.email!);

      User newUser = event.users.copyWith(id: userId);
      // Create a new list containing all previous users + the new user
      List<User> updatedUsersList = List.from(state.usersList)..add(newUser);
      emit(UserState(usersList: updatedUsersList));

      // Emit the new state
      emit(UserState(appUser: event.users, usersList: updatedUsersList));

      await _storage.write(
          key: LocalStorageKey.EMAIL, value: event.users.email);
      await _storage.write(
          key: LocalStorageKey.PASSWORD, value: event.users.password);
      await _storage.write(
          key: LocalStorageKey.PHONE_NUMBER, value: event.users.phoneNumber);
      await _storage.write(
          key: LocalStorageKey.LAST_NAME, value: event.users.lastName);
      await _storage.write(
          key: LocalStorageKey.FIRST_NAME, value: event.users.firstName);

      AlertBox.awesomeOkBox(
          event.context, "Registration", "Successfully saved user", () {
        NavigationScreen.navigate(event.context, GetStartedScreen());
      });
    }
    try {
      print(state.usersList);
    } catch (e) {
      AlertBox.awesomeOkBox(
          event.context, "Registration", "Online user not created", () {});
    }
  }

Future<void> _onLoginUser(LoginUser event, Emitter<UserState> emit) async {
  // Retrieve user data from local storage
  final storedEmail = await _storage.read(key: LocalStorageKey.EMAIL);
  final storedPassword = await _storage.read(key: LocalStorageKey.PASSWORD);
  final storedPhoneNumber = await _storage.read(key: LocalStorageKey.PHONE_NUMBER);
  final storedLastName = await _storage.read(key: LocalStorageKey.LAST_NAME);
  final storedFirstName = await _storage.read(key: LocalStorageKey.FIRST_NAME);

  // Check if the stored credentials match the ones from the login event
  if (event.email == storedEmail && event.password == storedPassword) {
    // Create a user model from the stored data
    final user = User(
      email: storedEmail,
      password: storedPassword,
      phoneNumber: storedPhoneNumber,
      lastName: storedLastName,
      firstName: storedFirstName,
    );
    
    print("Successfully logged in!");
    // Emit new state with logged-in user
    emit(UserState(appUser: user, usersList: state.usersList)); 
    loginStatusController.sink.add(true);
  } else {
    print("Invalid email or password");
    emit(UserState(appUser: null, usersList: state.usersList)); 
    loginStatusController.sink.add(false);
  }
}



// In your UserBloc
  // Future<void> _onLoginUser(LoginUser event, Emitter<UserState> emit) async {
  //   final state = this.state;

  //   // Find a user that matches the email and password
  //   User? matchedUser;
  //   print("the user in state are ${state.usersList}");
  //   for (var user in state.usersList) {
  //     if (user.email == event.email && user.password == event.password) {
  //       matchedUser = user;
  //       break;
  //     }
  //   }

  //   if (matchedUser != null) {
  //     print("Successfully logged in!");
  //     // Emit new state with logged-in user
  //     emit(UserState(appUser: matchedUser));
  //     loginStatusController.sink.add(true);
  //   } else {
  //     print("Invalid email or password");
  //     // Emit error state or handle accordingly
  //     print(state.usersList);
  //     loginStatusController.sink.add(false);
  //   }
  // }

  Future<void> _onUpdateUser(UpdateUsers event, Emitter<UserState> emit) async {
    // final state = this.state;
    // final user = event.users;
    // final index = state.appUser.indexOf(user);
    // //update Locale storage
    // List<User> alluser = List.from(state.appUser)..remove(user);
    // alluser.insert(
    //     index, user.copyWith());
  }

  FutureOr<void> _onDeleteUser(DeleteUsers event, Emitter<UserState> emit) {}
}
