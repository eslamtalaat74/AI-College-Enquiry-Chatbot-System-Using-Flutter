import 'package:chat_bot/API/message.dart';

class connection_laravel{
  static String protocol() {
    String type = "http://";
    return type;
  }

  static String ip() {
    String address = "192.168.43.136";
    return address;
  }

  static String port() {
    return '';
  }

  static String address() {
    return "/chatbot/public/api/";
  }

  static String login() {
    String url = "http://192.168.43.136:8000/api/login";
    return url;
  }

  static String deleteAccount() {
    String url = "http://192.168.43.136:8000/api/delete/profile";
    return url;
  }
  static String forgetPassword(){
    String url =/* protocol() + ip() + port() + address() +*/ "http://192.168.43.136:8000/api/password/forgot-password";
    return url;
  }
  static String feedback() {
    String url =/* protocol() + ip() + port() + address() +*/ "http://192.168.43.136:8000/api/feedback";
    return url;
  }
  static String register(){
    String url=/*protocol() + ip() + port() +address()  +*/ "http://192.168.43.136:8000/api/register";
    return url;
  }

  static String profile() {
    String url=protocol() + ip() + port() + address() + "user";
    return url;
  }

  static String updateProfile() {
    String url = protocol() + ip() + port() + address()+"updateProfile";
    return url;
  }

  static String logout() {
    String url = /*protocol() + ip() + port() + address()+"logout"*/ "http://192.168.43.136:8000/api/logout";
    return url;
  }
  static String messagesWithAcademic() {
    String url = /*protocol() + ip() + port() + address()+"logout"*/ "http://192.168.43.136:8000/api/messagesWithAcademic";
    return url;
  }
  static String messagesWithClerk() {
    String url = /*protocol() + ip() + port() + address()+"logout"*/ "http://192.168.43.136:8000/api/messagesWithClerk";
    return url;
  }
  static String sendMessageToAcademic() {
    String url = /*protocol() + ip() + port() + address()+"logout"*/ "http://192.168.43.136:8000/api/sendMessageToAcademic";
    return url;
  }
  static String sendMessageToClerk() {
    String url = /*protocol() + ip() + port() + address()+"logout"*/ "http://192.168.43.136:8000/api/sendMessageToClerk";
    return url;
  }
}



