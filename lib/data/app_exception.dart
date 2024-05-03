


class AppException implements Exception{


  final  message;
  final prefix ;
  AppException([this.message,this.prefix]);

  String toString(){
    return '$prefix$message';

  }
}
class fetchdataexception extends AppException {
  fetchdataexception([String? message]) : super(message, 'Some problem with fetching data');
}