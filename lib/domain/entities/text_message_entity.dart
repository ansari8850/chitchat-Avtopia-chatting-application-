import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TextMessageEntity extends Equatable {
  final String senderName;
  final String senderUID;
  final String recipientName;
  final String recipientUID;
  final String messageType;
  final String message;
  final String messageId;
  final Timestamp time;

  TextMessageEntity({
    this.senderName,
    this.senderUID,
    this.recipientName,
    this.recipientUID,
    this.messageType,
    this.message,
    this.messageId,
    this.time,
  });
  @override
  // TODO: implement props
  List<Object> get props => [
        senderUID,
        recipientName,
        recipientUID,
        messageType,
        message,
        messageId,
        time,
      ];
}
