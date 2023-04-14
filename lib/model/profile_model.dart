class ProfileModel {
  String firstname = '';
  String lastname = '';
  String nickname = '';
  String email = '';
  String phone = '';
  String houseNo = '';
  String villageNo = '';
  String subDistrict = '';
  String district = '';
  String province = '';
  String postalCode = '';
  String id = '';

  ProfileModel(
      String firstname,
      String lastname,
      String nickname,
      String email,
      String phone,
      String houseNo,
      String villageNo,
      String subDistrict,
      String district,
      String province,
      String postalCode,
      String id) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.nickname = nickname;
    this.email = email;
    this.phone = phone;
    this.houseNo = houseNo;
    this.villageNo = villageNo;
    this.subDistrict = subDistrict;
    this.district = district;
    this.province = province;
    this.postalCode = postalCode;
    this.id = id;
  }

  ProfileModel.empty() {
    this.firstname = '';
    this.lastname = '';
    this.nickname = '';
    this.email = '';
    this.phone = '';
    this.houseNo = '';
    this.villageNo = '';
    this.subDistrict = '';
    this.district = '';
    this.province = '';
    this.postalCode = '';
    this.id = '';
  }
}
