import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chitchat/app_const.dart';
import 'package:chitchat/domain/entities/my_chat_entity.dart';
import 'package:chitchat/domain/entities/text_message_entity.dart';
import 'package:chitchat/domain/usecase/add_to_my_chat_usecase.dart';
import 'package:chitchat/domain/usecase/get_one_to_one_single_user_chat_channel_usecae.dart';
//import 'package:chitchat/domain/usecase/get_one_to_one_single_user_chat_channel_usecase.dart';
import 'package:chitchat/domain/usecase/get_text_messages_usecase.dart';
import 'package:chitchat/domain/usecase/send_text_message_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'communication_state.dart';

class CommunicationCubit extends Cubit<CommunicationState> {
  final SendTextMessageUseCase sendTextMessageUseCase;
  final GetOneToOneSingleUserChatChannelUseCase
      getOneToOneSingleUserChatChannelUseCase;
  final GetTextMessagesUseCase getTextMessageUseCase;
  final AddToMyChatUseCase addToMyChatUseCase;

  CommunicationCubit({
    this.sendTextMessageUseCase,
    this.getOneToOneSingleUserChatChannelUseCase,
    this.getTextMessageUseCase,
    this.addToMyChatUseCase,
  }) : super(CommunicationInitial());

  Future<void> sendTextMessage({
    String senderName,
    String senderId,
    String recipientId,
    String recipientName,
    String message,
    String recipientPhoneNumber,
    String senderPhoneNumber,
  }) async {
    try {
      final channelId = await getOneToOneSingleUserChatChannelUseCase.call(
          senderId, recipientId);
      await sendTextMessageUseCase.sendTextMessage(
          TextMessageEntity(
            recipientName: recipientName,
            recipientUID: recipientId,
            senderName: senderName,
            time: Timestamp.now(),
            senderUID: senderId,
            message: message,
            messageId: "",
            messageType: AppConst.text,
          ),
          channelId);
      await addToMyChatUseCase.call(MyChatEntity(
        time: Timestamp.now(),
        senderName: senderName,
        senderUID: senderId,
        senderPhoneNumber: senderPhoneNumber,
        recipientName: recipientName,
        recipientUID: recipientId,
        recipientPhoneNumber: recipientPhoneNumber,
        recentTextMessage: message,
        profileURL: "",
        isRead: true,
        isArchived: false,
        channelId: channelId,
      ));
    } on SocketException catch (_) {
      emit(CommunicationFailure());
    } catch (_) {
      emit(CommunicationFailure());
    }
  }

  Future<void> getMessages({String senderId, String recipientId}) async {
    emit(CommunicationLoading());
    try {
      final channelId = await getOneToOneSingleUserChatChannelUseCase.call(
          senderId, recipientId);

      final messagesStreamData = getTextMessageUseCase.call(channelId);
      messagesStreamData.listen((messages) {
        emit(CommunicationLoaded(messages: messages));
      });
    } on SocketException catch (_) {
      emit(CommunicationFailure());
    } catch (_) {
      emit(CommunicationFailure());
    }
  }
}
