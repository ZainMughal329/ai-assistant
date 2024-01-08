class message {
  String msg;
  final MessageType msgType;
 message ({required this.msg,required this.msgType});
}

enum MessageType { user , bot }