
import 'dart:convert';

import 'AppUser.dart';

class Message {
  late final int id;
  late final String conversation_id;
  late final String description;
  late final dynamic sent_by ;
  late final dynamic sent_to;
  late final String status,created_at;
  late final String message_id;
  late final int booking_id;

  Message({
    required this.id,
    required this.conversation_id,
    required this.description,
    required this.sent_by,
    required this.sent_to,
    required this.status,
    required this.created_at,

    required this.message_id,
    required this.booking_id,

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> message = Map<String, dynamic>();
    message["id"] = this.id;
    message["conversation_id"] = this.conversation_id;
    message["description"] = this.description;
    message["sent_by"] = json.encode(this.sent_by);
    message["sent_to"] = json.encode(this.sent_to);
    message["status"] = this.status;
    message["message_id"] = this.message_id;
    message["booking_id"] = this.booking_id;


    return message;
  }

  factory Message.fromJsonWithOutParsing(Map<dynamic, dynamic> parsedJson){

    return Message(
      id: int.parse(parsedJson['id'].toString()),
      conversation_id : parsedJson['conversation_id'].toString(),
      description: parsedJson['description'].toString(),
      sent_by:parsedJson['sent_by'] is String ?  AppUser.fromJson(json.decode(parsedJson['sent_by'])) :  AppUser.fromJson(parsedJson['sent_by']),
      sent_to:parsedJson['sent_to'] is String ?  AppUser.fromJson(json.decode(parsedJson['sent_to'])) : AppUser.fromJson(parsedJson['sent_to']),
      status: parsedJson['status'].toString(),
      created_at: parsedJson['created_at'].toString(),
      booking_id: parsedJson['booking_id'],

      message_id: parsedJson['message_id'].toString(),
    );
  }

  factory Message.fromJsonWithEncodedAppUser(Map<String, dynamic> parsedJson){

    return Message(
      id: int.parse(parsedJson['id'].toString()),
      conversation_id : parsedJson['conversation_id'].toString(),
      description: parsedJson['description'].toString(),
      sent_by:parsedJson['sent_by'] is String ?  parsedJson['sent_by'] :  AppUser.fromJson(parsedJson['sent_by']),
      sent_to:parsedJson['sent_to'] is String ?  parsedJson['sent_to'] : AppUser.fromJson(parsedJson['sent_to']),
      status: parsedJson['status'].toString(),
      created_at: parsedJson['status'].toString(),
      message_id: parsedJson['message_id'].toString(),
      booking_id: parsedJson['booking_id'],
    );
  }

  factory Message.fromJson(Map<String, dynamic> parsedJson){

    print("converting to json manually");
    print(parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",").length);
    Map<String , dynamic> obj1Json =
    {
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[0].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[1],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[2].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[3],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[4].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[5],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[6].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[7],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[8].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[9],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[10].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[11],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[12].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[13],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[14].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[15],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[16].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[17],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[18].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[19],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[20].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[21],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[22].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[23],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[24].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[25],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[26].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[27],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[28].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[29],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[30].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[31],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[32].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[33],
      parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[34].trim() : parsedJson['sent_by'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[35],
    };

    Map<String , dynamic> obj2Json =
    {
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[0].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[1],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[2].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[3],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[4].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[5],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[6].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[7],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[8].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[9],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[10].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[11],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[12].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[13],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[14].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[15],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[16].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[17],

      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[18].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[19],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[20].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[21],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[22].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[23],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[24].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[25],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[26].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[27],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[28].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[29],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[30].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[31],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[32].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[33],
      parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[34].trim() : parsedJson['sent_to'].toString().replaceAll("}", "").replaceAll("{", "").replaceAll("=", ",").split(",")[35],
    };

    print("obj1Json");
    print(obj1Json);
    return Message(
      id: int.parse(parsedJson['id'].toString()),
      conversation_id : parsedJson['conversation_id'].toString(),
      description: parsedJson['description'].toString(),
      sent_by:AppUser.fromJson(obj1Json),
      sent_to:AppUser.fromJson(obj2Json),
      status: parsedJson['status'].toString(),
      created_at: parsedJson['created_at'].toString(),
      message_id: parsedJson['message_id'].toString(),
      booking_id: parsedJson['booking_id'],
    );
  }

}
