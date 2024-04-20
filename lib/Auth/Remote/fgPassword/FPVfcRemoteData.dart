
import '../../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  FPVfcRemoteData {
  CRUD crud;
  FPVfcRemoteData(this.crud);

  postData( email , vfc)async{
    var response = await crud.postData(LinksApp.linkFPVfcAdmin, {
      "admins_email": email,
      "admins_verflyCode": vfc,
    });
    return response.fold((l) => l, (r) => r);
  }


  resendData(email) async {
    var response = await crud.postData(LinksApp.linkResendVfcSignAdmin, {
      "admins_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}