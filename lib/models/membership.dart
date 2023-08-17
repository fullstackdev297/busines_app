import 'dart:convert';

List<MembershipPlan?>? membershipPlanFromJson(String str) => json.decode(str) == null ? [] : List<MembershipPlan?>.from(json.decode(str)!.map((x) => MembershipPlan.fromJson(x)));

String membershipPlanToJson(List<MembershipPlan?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class MembershipPlan {
  MembershipPlan({
    this.id,
    this.subscriptionAnnualAmt,
    required this.subscriptionAnnualCode,
    this.subscriptionMonthAmt,
    required this.subscriptionMonthCode,
    required this.subscriptionName,
    required this.subscriptionReportTransaction,
    required this.subscriptionSearch,
  });

  int? id;
  double? subscriptionAnnualAmt;
  String subscriptionAnnualCode;
  double? subscriptionMonthAmt;
  String subscriptionMonthCode;
  String subscriptionName;
  String subscriptionReportTransaction;
  String subscriptionSearch;

  factory MembershipPlan.fromJson(Map<String, dynamic> json) => MembershipPlan(
    id: json["id"],
    subscriptionAnnualAmt: json["subscription_annual_amt"].toDouble(),
    subscriptionAnnualCode: json["subscription_annual_code"] == null ? '' : json["subscription_annual_code"],
    subscriptionMonthAmt: json["subscription_month_amt"].toDouble(),
    subscriptionMonthCode: json["subscription_month_code"] == null ? '' : json["subscription_month_code"],
    subscriptionName: json["subscription_name"] == null ? '' : json["subscription_name"],
    subscriptionReportTransaction: json["subscription_report_transaction"] == null ? '' : json["subscription_report_transaction"],
    subscriptionSearch: json["subscription_search"] == null ? '' : json["subscription_search"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subscription_annual_amt": subscriptionAnnualAmt,
    "subscription_annual_code": subscriptionAnnualCode,
    "subscription_month_amt": subscriptionMonthAmt,
    "subscription_month_code": subscriptionMonthCode,
    "subscription_name": subscriptionName,
    "subscription_report_transaction": subscriptionReportTransaction,
    "subscription_search": subscriptionSearch,
  };
}