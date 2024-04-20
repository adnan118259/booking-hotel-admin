import '../../../../DB/CRUD.dart';
import '../../LinksConnect/LinksAPI.dart';

class SignUpRemoteData {
  CRUD crud;

  SignUpRemoteData(this.crud);

  postData(username , email , phone , password)async{
    var response = await crud.postData(LinksApp.linkSignUpAdmin, {
      "admins_name": username,
      "admins_email": email,
      "admins_phone": phone,
      "admins_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
