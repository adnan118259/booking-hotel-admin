import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class CategoriesRemoteData {
  CRUD crud;

  CategoriesRemoteData(this.crud);

  catview() async {
    var response = await crud.postData(LinksApp.linkCatView, {});
    return response.fold((l) => l, (r) => r);
  }

  catadd(categories_name, categories_name_ar, myfile) async {
    var response = await crud.postRequestWithFile(
        LinksApp.linkCatAdd,
        {
          "categories_name": categories_name,
          "categories_name_ar": categories_name_ar,
        },
        myfile);
    //   return response.fold((l) => l, (r) => r);
  }

  catedit(categories_id,categories_name, categories_name_ar,
      categories_img_old) async {
    var response = await crud.postData(LinksApp.linkCatEdit, {
      "categories_id": categories_id,
      "categories_name": categories_name,
      "categories_name_ar": categories_name_ar,
      "categories_img_old": categories_img_old,
    });
    return response.fold((l) => l, (r) => r);
  }

  cateditwithfile(categories_id,categories_name, categories_name_ar,
      categories_img_old, myfile) async {
    var response = await crud.postRequestWithFile(
        LinksApp.linkCatEdit,
        {
          "categories_id": categories_id,
          "categories_name": categories_name,
          "categories_name_ar": categories_name_ar,
          "categories_img_old": categories_img_old,
        },
        myfile);
  //  return response.fold((l) => l, (r) => r);
  }

  catdelet(categories_img, categories_id) async {
    var response = await crud.postData(LinksApp.linkCatDeleted, {
      "categories_img": categories_img,
      "categories_id": categories_id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
