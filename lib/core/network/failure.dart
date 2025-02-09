class Failure {
  int code; // 200, 201, 400, 303..500 and so on
  String status; // error , success
  String message;
  dynamic data;// error , success

  Failure({required this.code, required this.status, required this.message, this.data});
}