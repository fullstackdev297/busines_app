import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.address,
    required this.businessEmail,
    required this.businessName,
    this.businessSince,
    required this.city,
    required this.contactName,
    required this.email,
    required this.firstname,
    required this.id,
    required this.lastname,
    required this.legalForm,
    required this.licenseNum,
    required this.licensedState,
    this.numberSearch,
    required this.parentCompany,
    required this.phone,
    required this.score,
    required this.state,
    this.subscriptionActive,
    required this.taxId,
    required this.title,
    required this.typeOfBusiness,
    required this.zipCode,
  });

  String address;
  String businessEmail;
  String businessName;
  int? businessSince;
  String city;
  String contactName;
  String email;
  String firstname;
  int id;
  String lastname;
  String legalForm;
  String licenseNum;
  String licensedState;
  int? numberSearch;
  String parentCompany;
  String phone;
  String score;
  String state;
  bool? subscriptionActive;
  String taxId;
  String title;
  String typeOfBusiness;
  int zipCode;

  factory User.fromJson(Map<String, dynamic> json) => User(
    address: json["address"] == null ? '' : json["address"],
    businessEmail: json["business_email"] == null ? '' : json["business_email"],
    businessName: json["business_name"] == null ? '' : json["business_name"],
    businessSince: json["business_since"],
    city: json["city"] == null ? '' : json["city"],
    contactName: json["contact_name"] == null ? '' : json["contact_name"],
    email: json["email"] == null ? '' : json["email"],
    firstname: json["firstname"] == null ? '' : json["firstname"],
    id: json["id"],
    lastname: json["lastname"] == null ? '' : json["lastname"],
    legalForm: json["legal_form"] == null ? '' : json["legal_form"],
    licenseNum: json["license_num"] == null ? '' : json["license_num"],
    licensedState: json["licensed_state"] == null ? '' : json["licensed_state"],
    numberSearch: json["number_search"],
    parentCompany: json["parent_company"] == null ? '' : json["parent_company"],
    phone: json["phone"] == null ? '' : json["phone"],
    score: json["score"] == null ? '' : json["score"],
    state: json["state"] == null ? '' : json["state"],
    subscriptionActive: json["subscription_active"],
    taxId: json["tax_id"] == null ? '' : json["tax_id"],
    title: json["title"] == null ? '' : json["title"],
    typeOfBusiness: json["type_of_business"] == null ? '' : json["type_of_business"],
    zipCode: json["zip_code"] == null ? '' : json["zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "business_email": businessEmail,
    "business_name": businessName,
    "business_since": businessSince,
    "city": city,
    "contact_name": contactName,
    "email": email,
    "firstname": firstname,
    "id": id,
    "lastname": lastname,
    "legal_form": legalForm,
    "license_num": licenseNum,
    "licensed_state": licensedState,
    "number_search": numberSearch,
    "parent_company": parentCompany,
    "phone": phone,
    "score": score,
    "state": state,
    "subscription_active": subscriptionActive,
    "tax_id": taxId,
    "title": title,
    "type_of_business": typeOfBusiness,
    "zip_code": zipCode,
  };
}
