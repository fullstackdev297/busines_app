import 'dart:convert';

List<Business> businessFromJson(String str) => List<Business>.from(json.decode(str).map((x) => Business.fromJson(x)));

String businessToJson(List<Business> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Business {
  Business({
    required this.address,
    required this.businessEmail,
    required this.city,
    required this.companyContactName,
    required this.companyName,
    required this.id,
    required this.inBusinessSince,
    required this.late30,
    required this.late60,
    required this.late90,
    required this.legalForm,
    required this.outstandingInvoice,
    required this.phone,
    required this.score,
    required this.state,
    required this.stateLicenseNumber,
    required this.subParent,
    required this.taxId,
    required this.timesSearched,
    required this.title,
    required this.totalTransactionAmt,
    required this.typeOfBusiness,
    required this.verified,
    required this.zipCode,
  });

  String address;
  String businessEmail;
  String city;
  String companyContactName;
  String companyName;
  int id;
  int inBusinessSince;
  int late30;
  int late60;
  int late90;
  String legalForm;
  int outstandingInvoice;
  String phone;
  String score;
  String state;
  String stateLicenseNumber;
  String subParent;
  String taxId;
  int timesSearched;
  String title;
  double totalTransactionAmt;
  String typeOfBusiness;
  bool verified;
  int zipCode;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    address: json["address"],
    businessEmail: json["business_email"],
    city: json["city"],
    companyContactName: json["company_contact_name"],
    companyName: json["company_name"],
    id: json["id"],
    inBusinessSince: json["in_business_since"],
    late30: json["late_30"],
    late60: json["late_60"],
    late90: json["late_90"],
    legalForm: json["legal_form"],
    outstandingInvoice: json["outstanding_invoice"],
    phone: json["phone"],
    score: json["score"],
    state: json["state"],
    stateLicenseNumber: json["state_license_number"],
    subParent: json["sub_parent"],
    taxId: json["tax_id"],
    timesSearched: json["times_searched"],
    title: json["title"],
    totalTransactionAmt: json["total_transaction_amt"],
    typeOfBusiness: json["type_of_business"],
    verified: json["verified"],
    zipCode: json["zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "business_email": businessEmail,
    "city": city,
    "company_contact_name": companyContactName,
    "company_name": companyName,
    "id": id,
    "in_business_since": inBusinessSince,
    "late_30": late30,
    "late_60": late60,
    "late_90": late90,
    "legal_form": legalForm,
    "outstanding_invoice": outstandingInvoice,
    "phone": phone,
    "score": score,
    "state": state,
    "state_license_number": stateLicenseNumber,
    "sub_parent": subParent,
    "tax_id": taxId,
    "times_searched": timesSearched,
    "title": title,
    "total_transaction_amt": totalTransactionAmt,
    "type_of_business": typeOfBusiness,
    "verified": verified,
    "zip_code": zipCode,
  };
}
