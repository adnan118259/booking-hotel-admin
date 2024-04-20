import '../../../../DB/CRUD.dart';
import '../../LinksConnect/LinksAPI.dart';

class LoginRemoteData {
  CRUD crud;

  LoginRemoteData(this.crud);

  postData(email, password) async {
    var response = await crud.postData(LinksApp.linkLoginAdmin, {
      "admins_email": email,
      "admins_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
