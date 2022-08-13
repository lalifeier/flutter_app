import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class UserInfo {

  const UserInfo({
    this.username,
  });

  final String? username;

  factory UserInfo.fromJson(Map<String,dynamic> json) => UserInfo(
    username: json['username']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'username': username
  };

  UserInfo clone() => UserInfo(
    username: username
  );


  UserInfo copyWith({
    Optional<String?>? username
  }) => UserInfo(
    username: checkOptional(username, () => this.username),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is UserInfo && username == other.username;

  @override
  int get hashCode => username.hashCode;
}
