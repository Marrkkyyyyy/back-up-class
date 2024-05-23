import 'package:e_learning/core/class/crud.dart';
import 'package:e_learning/link_api.dart';

class AuthData {
  Crud crud;
  AuthData(this.crud);

  checkEmail(
    String? email,
    String? fullName,
    String? profile,
  ) async {
  
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
      "fullName": fullName,
      "profile": profile,
    });

    return response.fold((l) => l, (r) => r);
  }
}
