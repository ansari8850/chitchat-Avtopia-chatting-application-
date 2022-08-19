import 'package:bloc/bloc.dart';
import 'package:chitchat/domain/usecase/get_current_uid_usecase.dart';
import 'package:chitchat/domain/usecase/is_sign_in_usecase.dart';
import 'package:chitchat/domain/usecase/sign_out_usecase.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final SignOutUseCase signOutUseCase;
  AuthCubit(
      {this.isSignInUseCase, this.signOutUseCase, this.getCurrentUidUseCase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      bool isSignIn = await isSignInUseCase.call();

      if (isSignIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(Aunthenticated(uid: uid));
      } else
        emit(UnAunthenticated());
    } catch (_) {
      emit(UnAunthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.call();
      emit(Aunthenticated(uid: uid));
    } catch (_) {}
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAunthenticated());
    } catch (_) {}
  }
}
