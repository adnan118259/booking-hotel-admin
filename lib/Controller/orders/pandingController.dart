import 'package:get/get.dart';

import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/bookRemoteData.dart';
import '../../Data/Model/OrdersModel.dart';
import 'CurrentController.dart';

class PandingOrders_Controller extends GetxController{

  Myservices myservices =Get.find();
  BookRemoteData pandingRemoteData = BookRemoteData(Get.find());

  List <OrdersModel>data=[];
  late StatusRequest statusRequest ;
  @override
  getOrders( 	)async{
    data.clear();
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await pandingRemoteData.getDataPanding( );
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listData=response["data"];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  @override
  approveOrders( orders_id ,users_id	)async{
    data.clear();
    getOrders( 	);
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await pandingRemoteData.approveOrder(orders_id.toString() ,users_id.toString());
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        Current_Controller current_controller=Get.put(Current_Controller());
        current_controller.getOrders();
        data.clear();
        getOrders();
        Get.offNamed("/MainTapOrders");
      print("success success success success success success success success");
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  /////////////////////
  @override
  deletOrders( orders_id	)async{
    getOrders( 	);
    statusRequest = StatusRequest.loading;
    update();

    //loading
    var response = await pandingRemoteData.deleteDataPanding( orders_id.toString());
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        Get.snackbar("Done".tr, " deleted".tr);
        Get.toNamed("/MainTapOrders");
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }


  convertPaymentWay(val){
    if(val ==1){return "Cash";}
    else if(val ==0){return "Bank Card";}
  }
  convertShippingWay(val){
    if(val ==0){return "Delivery";}
    else{return "Parcel Shop";}
  }
   convertStaus(val){
    if(val ==1){return "Current";}
    else if(val==0){return "Processes";}
    else{return "Archive";}
  }
  convertCoupon(val){
    if(val >0){return "Used";}
    else{return "Did not use";}
  }

  refreshPendingBook(){
    getOrders();
  }
  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}