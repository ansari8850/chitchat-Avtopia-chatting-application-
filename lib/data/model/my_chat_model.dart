import 'package:chitchat/domain/entities/my_chat_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyChatModel extends MyChatEntity {
  MyChatModel({
    String senderName,
    String senderUID,
    String recipientName,
    String recipientUID,
    String channelId,
    String profileURL,
    String recipientPhoneNumber,
    String senderPhoneNumber,
    String recentTextMessage,
    bool isRead,
    bool isArchived,
    Timestamp time,
  }) : super(
          senderName: senderName,
          senderUID: senderUID,
          recipientName: recipientName,
          recipientUID: recipientUID,
          channelId: channelId,
          profileURL: profileURL,
          recipientPhoneNumber: recipientPhoneNumber,
          senderPhoneNumber: senderPhoneNumber,
          recentTextMessage: recentTextMessage,
          isRead: isRead,
          isArchived: isArchived,
          time: time,
        );
  factory MyChatModel.fromSnapShot(DocumentSnapshot snapshot) {
    return MyChatModel(
      senderName: (snapshot.data() as Map)['senderName'],
      senderUID: (snapshot.data() as Map)['senderUID'],
      senderPhoneNumber: (snapshot.data() as Map)['senderPhoneNumber'],
      recipientName: (snapshot.data() as Map)['recipientName'],
      recipientUID: (snapshot.data() as Map)['recipientUID'],
      recipientPhoneNumber: (snapshot.data() as Map)['recipientPhoneNumber'],
      channelId: (snapshot.data() as Map)['channelId'],
      time: (snapshot.data() as Map)['time'],
      isArchived: (snapshot.data() as Map)['isArchived'],
      isRead: (snapshot.data() as Map)['isRead'],
      recentTextMessage: (snapshot.data() as Map)['recentTextMessage'],
      profileURL: (snapshot.data() as Map)['profileURL'],
    );
  }
  Map<String, dynamic> toDocument() {
    return {
      "senderName": senderName,
      "senderUID": senderUID,
      "recipientName": recipientName,
      "recipientUID": recipientUID,
      "channelId": channelId,
      "profileURL": profileURL,
      "recipientPhoneNumber": recipientPhoneNumber,
      "senderPhoneNumber": senderPhoneNumber,
      "recentTextMessage": recentTextMessage,
      "isRead": isRead,
      "isArchived": isArchived,
      "time": time,
    };
  }
}
