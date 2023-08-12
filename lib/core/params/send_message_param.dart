import 'package:tonjoo/core/enums/message_type.dart';

class SendMessageParams {
  final String title;
  final String? message;
  final MessageType type;

  const SendMessageParams({
    required this.title,
    this.message,
    required this.type
  });
}