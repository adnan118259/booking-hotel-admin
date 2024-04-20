
import '../../../DB/CRUD.dart';
import '../../../LinksConnect/LinksAPI.dart';

class  BookRemoteData {
  CRUD crud;

  BookRemoteData(this.crud);

  //pending  booking
  getDataPanding()async{
    var response = await crud.postData(LinksApp.linkPandingOrderAdmin, {

    });
    return response.fold((l) => l, (r) => r);
  }

  ////approveOrder
  approveOrder(orders_id,users_id)async{
    var response = await crud.postData(LinksApp.linkApproveOrderAdmin, {
      "orders_id":orders_id,
      "users_id":users_id,
    });
    return response.fold((l) => l, (r) => r);
  }
  // current booking
  getDataCurrent()async{
    var response = await crud.postData(LinksApp.linkCurrentOrderAdmin, {
    });
    return response.fold((l) => l, (r) => r);
  }

  ////Archive booking
  getDataArchive( )async{
    var response = await crud.postData(LinksApp.linkArchiveOrderAdmin, {
     });
    return response.fold((l) => l, (r) => r);
  }
  ////  Details booking
  getDataDetails(orders_id)async{
    var response = await crud.postData(LinksApp.linkOrdersdetailsAdmin, {
      "book_orders":orders_id.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  deleteDataPanding(orders_id)async{
    var response = await crud.postData(LinksApp.linkRemoveorder, {
      "orders_id":orders_id
    });
    return response.fold((l) => l, (r) => r);
  }


  Rating(orders_id,orderscomment,ordersrating)async{
    var response = await crud.postData(LinksApp.linkRating, {
      "orders_id":orders_id,
      "orders_comment" :orderscomment,
      "orders_rating":ordersrating,
    });
    return response.fold((l) => l, (r) => r);
  }


  getDataBookRemoteData( String book_usersid)async{
    var response = await crud.postData(LinksApp.linkBookView, {
      "book_usersid":book_usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
  //remove

  removeBookRemoteData(usersid, book_roomid) async {
    var response = await crud.postData(LinksApp.linkBookRemove, {
      "book_usersid": usersid.toString(),
      "book_roomid": book_roomid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

//add
  addBookRemoteData(  usersid, book_roomid)async{
    var response = await crud.postData(LinksApp.linkBookAdd, {
      "book_usersid":usersid.toString(),
      "book_roomid":book_roomid.toString(),

    });
    return response.fold((l) => l, (r) => r);
  }


  checkCoupon(couponname )async{
    var response = await crud.postData(LinksApp.linkCoupon, {
      "coupon_name":couponname.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

}