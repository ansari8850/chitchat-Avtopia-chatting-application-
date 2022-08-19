part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Aunthenticated extends AuthState {
  final String uid;

  Aunthenticated({this.uid});
  @override
  List<Object> get props => [];
}

class UnAunthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
