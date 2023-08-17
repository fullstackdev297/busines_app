import 'package:cannicheck/views/payment.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../helper/authenticate.dart';
import '../models/membership.dart';
import '../models/user.dart';
import '../service/http_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Membership extends StatefulWidget {
  final User? user;
  const Membership(this.user, {Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {

  List<MembershipPlan?>? membership_plans;
  bool isLoading = true;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      color: isLightMode ? AppTheme.white : AppTheme.nearlyBlack,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                isLoading ? Container(
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Image.asset(
                        "assets/images/logo.jpg",
                        height: 250,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20,),
                      Text("You have to purchase new Membership", style: TextStyle(fontSize: 18,),),
                      SizedBox(height: 10,),
                      MaterialButton(
                        color: Theme.of(context).primaryColor,
                        height: 20,
                        minWidth: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Theme.of(context).primaryColor)),
                        child: Text(
                          "Details",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          membership_plans = await HttpService().plans();
                          setState(() {
                            if(membership_plans != null){
                              isLoading = !isLoading;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ) :
                Flexible(
                  child: ListView.builder(
                      itemCount: membership_plans?.length,
                      itemBuilder: (context, index){
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                ),
                                color: Colors.grey[100],
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(membership_plans![index]!.subscriptionName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                SizedBox(height: 10,),
                                Text("\$"+ membership_plans![index]!.subscriptionAnnualAmt.toString() +" a month or "+ "\$"+ membership_plans![index]!.subscriptionMonthAmt.toString() +" for the year",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                SizedBox(height: 10,),
                                Text("This allows you to see your profile with the following information",
                                style: TextStyle(fontSize: 16),),
                                SizedBox(height: 10,),
                                Divider(height: 1, color: AppTheme.grey,),
                                SizedBox(height: 10,),
                                Text("How many times you were searched",
                                  style: TextStyle(fontSize: 16),),
                                SizedBox(height: 10,),
                                Text("Your grade", style: TextStyle(fontSize: 16),),
                                SizedBox(height: 10,),
                                membership_plans![index]!.subscriptionSearch.toString() == "0" ? Container() :
                                Text("Search a business ("+ membership_plans![index]!.subscriptionSearch +" searches a month)",
                                  style: TextStyle(fontSize: 16,),),
                                SizedBox(height: 10,),
                                membership_plans![index]!.subscriptionReportTransaction.toString() == "0" ? Container() :
                                Text("Report a transaction ("+ membership_plans![index]!.subscriptionReportTransaction +" reports a month)",
                                  style: TextStyle(fontSize: 16,),),
                                SizedBox(height: 10,),
                                membership_plans![index]!.subscriptionSearch.toString() == "0" ? Container() :
                                Text("Transactions to date", style: TextStyle(fontSize: 16),),
                                SizedBox(height: 10,),
                                membership_plans![index]!.subscriptionSearch.toString() == "0" ? Container() :
                                Text("Outstanding transactions", style: TextStyle(fontSize: 16),),
                                SizedBox(height: 10,),
                                membership_plans![index]!.subscriptionSearch.toString() == "0" ? Container() :
                                Text("How many reports are on your company", style: TextStyle(fontSize: 16),),
                                SizedBox(height: 10,),
                                MaterialButton(
                                  color: Theme.of(context).primaryColor,
                                  height: 16,
                                  minWidth: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Theme.of(context).primaryColor)),
                                  child: Text("PURCHASE NOW", style: TextStyle(color: Colors.white, fontSize: 16),),
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: Text(membership_plans![index]!.subscriptionName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                      content: const Text('Select Membership'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () async {
                                            prefs = await SharedPreferences.getInstance();
                                            prefs.setString("cost", membership_plans![index]!.subscriptionMonthAmt.toString());
                                            // make PayPal payment
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (BuildContext context) => Payment(widget.user,
                                                  onFinish: (number) async {
                                                    // payment done
                                                    final snackBar = SnackBar(
                                                      content: const Text("Payment done Successfully"),
                                                      duration: const Duration(seconds: 5),
                                                      action: SnackBarAction(
                                                        label: 'Close',
                                                        onPressed: () {
                                                          // Some code to undo the change.
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(builder: (_) => Authenticate())
                                                          );
                                                        },
                                                      ),
                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text("\$"+ membership_plans![index]!.subscriptionMonthAmt.toString() +" MONTHLY",
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            prefs = await SharedPreferences.getInstance();
                                            prefs.setString("cost", membership_plans![index]!.subscriptionAnnualAmt.toString());
                                            // make PayPal payment
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (BuildContext context) => Payment(widget.user,
                                                  onFinish: (number) async {
                                                    // payment done
                                                    final snackBar = SnackBar(
                                                      content: const Text("Payment done Successfully"),
                                                      duration: const Duration(seconds: 5),
                                                      action: SnackBarAction(
                                                        label: 'Close',
                                                        onPressed: () {
                                                          // Some code to undo the change.
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(builder: (_) => Authenticate())
                                                          );
                                                        },
                                                      ),
                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text("\$"+ membership_plans![index]!.subscriptionAnnualAmt.toString() +" YEARLY",
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
