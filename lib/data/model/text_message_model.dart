import 'package:chitchat/domain/entities/text_message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TextMessageModel extends TextMessageEntity {
  TextMessageModel({
    String senderName,
    String senderUID,
    String recipientName,
    String recipientUID,
    String messageType,
    String message,
    String messageId,
    Timestamp time,
  }) : super(
          senderName: senderName,
          senderUID: senderUID,
          recipientName: recipientName,
          recipientUID: recipientUID,
          messageType: messageType,
          message: message,
          messageId: messageId,
          time: time,
        );

  factory TextMessageModel.fromSnapShot(DocumentSnapshot snapshot) {
    return TextMessageModel(
      senderName: (snapshot.data() as Map)['senderName'],
      senderUID: (snapshot.data() as Map)['senderUID'],
      recipientName: (snapshot.data() as Map)['recipientName'],
      recipientUID: (snapshot.data() as Map)['recipientUID'],
      messageType: (snapshot.data() as Map)['messageType'],
      message: (snapshot.data() as Map)['message'],
      messageId: (snapshot.data() as Map)['messageId'],
      time: (snapshot.data() as Map)['time'],
    );
  }
  Map<String, dynamic> toDocument() {
    return {
      "senderName": senderName,
      "sederUID": senderUID,
      "recipientName": recipientName,
      "recipientUID": recipientUID,
      "messageType": messageType,
      "message": message,
      "messageId": messageId,
      "time": time,
    };
  }
}
