class AdminsModel {
  int? adminsId;
  String? adminsName;
  String? adminsFullName;
  String? adminsDesc;
  String? adminsEmail;
  String? adminsPhone;
  String? adminsPassword;
  String? adminsVerflyCode;
  int? adminsApprove;
  String? adminsCreateTime;
  String? adminsImage;

  AdminsModel(
      {this.adminsId,
        this.adminsName,
        this.adminsFullName,
        this.adminsDesc,
        this.adminsEmail,
        this.adminsPhone,
        this.adminsPassword,
        this.adminsVerflyCode,
        this.adminsApprove,
        this.adminsCreateTime,
        this.adminsImage});

  AdminsModel.fromJson(Map<String, dynamic> json) {
    adminsId = json['admins_id'];
    adminsName = json['admins_name'];
    adminsFullName = json['admins_fullName'];
    adminsDesc = json['admins_desc'];
    adminsEmail = json['admins_email'];
    adminsPhone = json['admins_phone'];
    adminsPassword = json['admins_password'];
    adminsVerflyCode = json['admins_verflyCode'];
    adminsApprove = json['admins_approve'];
    adminsCreateTime = json['admins_createTime'];
    adminsImage = json['admins_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admins_id'] = this.adminsId;
    data['admins_name'] = this.adminsName;
    data['admins_fullName'] = this.adminsFullName;
    data['admins_desc'] = this.adminsDesc;
    data['admins_email'] = this.adminsEmail;
    data['admins_phone'] = this.adminsPhone;
    data['admins_password'] = this.adminsPassword;
    data['admins_verflyCode'] = this.adminsVerflyCode;
    data['admins_approve'] = this.adminsApprove;
    data['admins_createTime'] = this.adminsCreateTime;
    data['admins_image'] = this.adminsImage;
    return data;
  }
}