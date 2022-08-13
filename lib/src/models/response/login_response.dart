import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class LoginResponse {

  const LoginResponse({
    required this.username,
  });

  final String username;

  factory LoginResponse.fromJson(Map<String,dynamic> json) => LoginResponse(
    username: json['username'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'username': username
  };

  LoginResponse clone() => LoginResponse(
    username: username
  );


  LoginResponse copyWith({
    String? username
  }) => LoginResponse(
    username: username ?? this.username,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is LoginResponse && username == other.username;

  @override
  int get hashCode => username.hashCode;
}
