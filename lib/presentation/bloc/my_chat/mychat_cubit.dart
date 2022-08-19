import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chitchat/domain/entities/my_chat_entity.dart';
import 'package:chitchat/domain/usecase/get_my_chat_usecase.dart';
import 'package:equatable/equatable.dart';
part 'mychat_state.dart';

class MychatCubit extends Cubit<MyChatState> {
  final GetMyChatUseCase getMyChatUseCase;

  MychatCubit({this.getMyChatUseCase}) : super(MyChatInitial());

  Future<void> getMyChat({String uid}) async {
    try {
      final myChatStreamData = getMyChatUseCase.call(uid);
      myChatStreamData.listen((myChatData) {
        emit(MyChatLoaded(myChat: myChatData));
      });
    } on SocketException catch (_) {
    } catch (_) {}
  }
}
