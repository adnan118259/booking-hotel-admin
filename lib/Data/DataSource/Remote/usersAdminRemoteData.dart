import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class UsersAdminRemoteData {
  CRUD crud;

  UsersAdminRemoteData(this.crud);

  usersview() async {
    var response = await crud.postData(LinksApp.linkUsersView, {});
    return response.fold((l) => l, (r) => r);
  }

  usersadd(users_name,users_fullName,users_desc,users_email, users_phone,users_password,users_approve,myfile) async {
    var response = await crud.postRequestWithFile(
        LinksApp.linkUsersAdd,
        {

        "users_name":users_name,
        "users_fullName":users_fullName,
        "users_desc":users_desc,
        "users_email":users_email,
        "users_phone":users_phone,
        "users_password":users_password,
        "users_approve":users_approve,
        },
        myfile);
 //  return response.fold((l) => l, (r) => r);
  }

  usersedit(usersid,users_name,users_fullName, users_email,users_phone,users_password,users_desc,users_image) async {
    var response = await crud.postData(LinksApp.linkUsersEdit,   {

    "users_id":usersid,
    "users_name":users_name,
    "users_fullName":users_fullName,
    "users_email":users_email,
    "users_phone":users_phone,
    "users_password":users_password,
    "users_desc":users_desc,
    "users_image":users_image,


    },);
    return response.fold((l) => l, (r) => r);
  }

  userseditwithfile(usersid,users_name,users_fullName, users_email,users_phone,users_password,users_desc,users_image,myfile) async {
    var response = await crud.postRequestWithFile(
        LinksApp.linkUsersEdit,
        {
          "users_id":usersid,
          "users_name":users_name,
          "users_fullName":users_fullName,
          "users_email":users_email,
          "users_phone":users_phone,
          "users_password":users_password,
          "users_desc":users_desc,
          "users_image":users_image,
        },
        myfile);
  //  return response.fold((l) => l, (r) => r);
  }

  usersdelet(users_id,) async {
    var response = await crud.postData(LinksApp.linkUsersDeleted, {
      "users_id": users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
