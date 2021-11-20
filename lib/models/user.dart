import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? userId;
  final String userName;
  final String? avatarUrl;
  final String userPhone;
  final String userAddress;

  const User({
    this.userId,
    required this.userName,
    this.avatarUrl,
    required this.userPhone,
    required this.userAddress,
  });

  @override
  List<Object?> get props => [
        userId,
        userName,
        avatarUrl,
        userPhone,
        userAddress,
      ];
}
