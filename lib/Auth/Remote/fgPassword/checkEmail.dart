
import '../../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  CheckEmailRemoteData {
  CRUD crud;
  CheckEmailRemoteData(this.crud);

  postData( email )async{
    var response = await crud.postData(LinksApp.linkCheckEmailAdmin, {
      "admins_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}