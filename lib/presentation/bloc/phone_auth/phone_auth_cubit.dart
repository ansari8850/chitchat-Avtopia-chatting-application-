import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chitchat/domain/entities/user_entity.dart';
import 'package:chitchat/domain/usecase/get_create_current_user_usercase.dart';
import 'package:chitchat/domain/usecase/sign_in_with_phone_number_usecase.dart';
import 'package:chitchat/domain/usecase/verify_phone_number_usecase.dart';
import 'package:equatable/equatable.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final SignInWithPhoneNumberUseCase signInWithPhoneNumberUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;

  PhoneAuthCubit(
      {this.signInWithPhoneNumberUseCase,
      this.getCreateCurrentUserUseCase,
      this.verifyPhoneNumberUseCase})
      : super(PhoneAuthInitial());

  Future<void> submitVerifyPhoneNumber({String phoneNumber}) async {
    emit(PhoneAuthLoading());
    try {
      await verifyPhoneNumberUseCase.call(phoneNumber);
      emit(PhoneAuthSmsCodeReceived());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }

  Future<void> submitSmsCode({String smsCode}) async {
    emit(PhoneAuthLoading());
    try {
      await signInWithPhoneNumberUseCase.call(smsCode);
      emit(PhoneAuthProfileInfo());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }

  Future<void> submitProfileInfo({
    String name,
    String profileUrl,
    String phoneNumber,
  }) async {
    try {
      await getCreateCurrentUserUseCase.call(UserEntity(
        uid: "",
        name: name,
        email: "",
        phoneNumber: phoneNumber,
        isOnline: true,
        profileUrl: profileUrl,
        status: "",
      ));
      emit(PhoneAuthSuccess());
    } on SocketException catch (_) {
      emit(PhoneAuthFailure());
    } catch (_) {
      emit(PhoneAuthFailure());
    }
  }
}
