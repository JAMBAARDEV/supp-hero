class ChatMessageModel {
  String author;
  String message;
  String time;

  ChatMessageModel({this.author, this.message, this.time});
  ChatMessageModel.fromMap(Map mapped) {
    author = mapped['author'];
    message = mapped['message'];
    time = mapped['time'];
  }
}
