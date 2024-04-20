import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class RoomsAdminRemoteData {
  CRUD crud;

  RoomsAdminRemoteData(this.crud);

  roomview() async {
    var response = await crud.postData(LinksApp.linkRoomView, {});
    return response.fold((l) => l, (r) => r);
  }

  roomadd(room_categories,room_desc,room_desc_ar,room_discount, room_numfloor,room_numroom,room_price,room_active,myfile) async {
    var response = await crud.postRequestWithFile(
        LinksApp.linkRoomAdd,
        {
          "room_categories": room_categories.toString(),
          "room_desc": room_desc.toString(),
          "room_desc_ar": room_desc_ar.toString(),
          "room_discount": room_discount.toString(),
          "room_numfloor": room_numfloor.toString(),
          "room_numroom": room_numroom.toString(),
          "room_price": room_price.toString(),
          "room_active": room_active,
        },
        myfile);
    //return response.fold((l) => l, (r) => r);
  }

  roomedit(room_categories,room_desc,room_desc_ar,room_discount, room_numfloor,room_numroom,room_price,room_active,room_img_old,room_id) async {
    var response = await crud.postData(LinksApp.linkRoomEdit,   {
      "room_categories": room_categories,
      "room_desc": room_desc,
      "room_desc_ar": room_desc_ar,
      "room_discount": room_discount,
      "room_numfloor": room_numfloor,
      "room_numroom": room_numroom,
      "room_price": room_price,
      "room_active": room_active,
      "room_img_old": room_img_old,
      "room_id": room_id,
    },);
    return response.fold((l) => l, (r) => r);
  }

  roomeditwithfile(room_categories,room_desc,room_desc_ar,room_discount, room_numfloor,room_numroom,room_price,room_active,room_img_old,room_id,myfile) async {
    var response = await crud.postRequestWithFile(
        LinksApp.linkRoomEdit,
        {
          "room_categories": room_categories,
          "room_desc": room_desc,
          "room_desc_ar": room_desc_ar,
          "room_discount": room_discount,
          "room_numfloor": room_numfloor,
          "room_numroom": room_numroom,
          "room_price": room_price,
          "room_active": room_active,
          "room_img_old": room_img_old,
          "room_id": room_id,
        },
        myfile);
  //  return response.fold((l) => l, (r) => r);
  }

  roomdelet(room_img, room_id) async {
    var response = await crud.postData(LinksApp.linkRoomDeleted, {
      "room_img": room_img,
      "room_id": room_id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
