import 'package:e_mart/utils/formatters/formatter.dart';

class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? profilePicture;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.phoneNumber,
      this.profilePicture});

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber!);
  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";

    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  UserModel copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? username,
      String? email,
      String? phoneNumber,
      String? profilePicture}) {
    return UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        profilePicture: profilePicture ?? this.profilePicture);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] == null ? null : json['id'] as String,
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        username: json['username'] == null ? null : json['username'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        phoneNumber:
            json['phoneNumber'] == null ? null : json['phoneNumber'] as String,
        profilePicture: json['profilePicture'] == null
            ? null
            : json['profilePicture'] as String);
  }

  @override
  String toString() {
    return '''UserModel(
                id:$id,
firstName:$firstName,
lastName:$lastName,
username:$username,
email:$email,
phoneNumber:$phoneNumber,
profilePicture:$profilePicture
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.username == username &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.profilePicture == profilePicture;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, firstName, lastName, username, email,
        phoneNumber, profilePicture);
  }
}
