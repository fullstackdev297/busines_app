import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../app_theme.dart';
import '../models/user.dart';
import '../service/http_service.dart';
import 'navigation_home.dart';

class CreateTransaction extends StatefulWidget {
  final User? user;

  final Function toggle;
  const CreateTransaction(this.user, this.toggle, {Key? key}) : super(key: key);

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {

  var company = TextEditingController();
  var routine_solution = TextEditingController();
  var dateTime = TextEditingController();
  var metrics = TextEditingController();
  var amount = TextEditingController();

  // late TextEditingController dateTime;
  String? transaction_date;
  bool isChecked = false;
  File? file1, file2, file3;
  bool is_terms1 = false, is_terms2 = false, is_terms3 = false;
  bool isLoading = false;

  late String _localPath;
  late bool _permissionReady;
  late TargetPlatform? platform;

  var download_url = "https://cannicheck.herokuapp.com/static/pdf/cannicheck_term.pdf";

  @override
  void initState() {
    super.initState();
    company.text = widget.user!.firstname;
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
    // dateTime = TextEditingController(text: DateTime.now().toString());
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;

    print(_localPath);
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
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
          body: isLoading ? Center(child: CircularProgressIndicator()) : Padding(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.grey[100],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      controller: company,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox( height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.grey[100],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      controller: routine_solution,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Routine Solution LLC',
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox( height: 20,),
                  DateTimePicker(
                    type: DateTimePickerType.dateTime,
                    dateMask: 'yyyy-MM-dd HH:mm',
                    controller: dateTime,
                    //initialValue: _initialValue,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    //icon: Icon(Icons.event),
                    dateLabelText: 'Date of Transaction',
                    use24HourFormat: true,
                    locale: Locale('en', 'US'),
                    onChanged: (val) => setState(() => transaction_date = val),
                    validator: (val) {
                      setState(() => transaction_date = val ?? '');
                      return null;
                    },
                    onSaved: (val) => setState(() => transaction_date = val ?? ''),
                  ),
                  SizedBox( height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.grey[100],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      controller: metrics,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Metrics',
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox( height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.grey[100],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      controller: amount,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Transaction Amount',
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox( height: 20,),
                  Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () async{
                          _permissionReady = await _checkPermission();
                          if (_permissionReady) {
                            await _prepareSaveDir();
                            print("Downloading");
                            try {
                              await Dio().download("https://cannicheck.com/static/pdf/cannicheck_term.pdf",
                                  _localPath + "/" + "cannicheck_term.pdf");
                              print("Download Completed.");
                            } catch (e) {
                              print("Download Failed.\n\n" + e.toString());
                            }
                          }
                        },
                        child: Text('Download', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      SizedBox(width: 5,),
                      Expanded(child: Text("Invoice terms and condition document", style: TextStyle(fontSize: 16)),)
                    ],
                  ),
                  SizedBox( height: 20,),
                  Row(
                    children: [
                      Text("Upload Terms", style: TextStyle(fontSize: 16,)),
                      SizedBox(width: 5,),
                      TextButton(
                        onPressed: () async {
                          FilePickerResult? result = await await FilePicker.platform.pickFiles();
                          if (result != null) {
                            setState(() {
                              file1 = File(result.files.single.path.toString());
                              is_terms1 = true;
                            });
                          } else {
                            print('No file selected');
                          }
                        },
                        child: Text('Choose File', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      SizedBox(width: 5,),
                      is_terms1 ? Text(basename(file1!.path), style: TextStyle(color: Colors.redAccent, fontSize: 12),) : Container(),
                    ],
                  ),
                  SizedBox( height: 20,),
                  Row(
                    children: [
                      Text("Upload Invoice", style: TextStyle(fontSize: 16,)),
                      SizedBox(width: 5,),
                      TextButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            setState(() {
                              file2 = File(result.files.single.path.toString());
                              is_terms2 = true;
                            });
                          } else {
                            print('No file selected');
                          }
                        },
                        child: Text('Choose File', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      SizedBox(width: 5,),
                      is_terms2 ? Text(basename(file2!.path), style: TextStyle(color: Colors.redAccent, fontSize: 12),) : Container(),
                    ],
                  ),
                  SizedBox( height: 20,),
                  Row(
                    children: [
                      Text("Upload Manifest", style: TextStyle(fontSize: 16,)),
                      SizedBox(width: 5,),
                      TextButton(
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            setState(() {
                              file3 = File(result.files.single.path.toString());
                              is_terms3 = true;
                            });
                          } else {
                            print('No file selected');
                          }
                        },
                        child: Text('Choose File', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      SizedBox(width: 5,),
                      is_terms3 ? Text(basename(file3!.path), style: TextStyle(color: Colors.redAccent, fontSize: 12),) : Container(),
                    ],
                  ),
                  SizedBox( height: 20,),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Expanded(child: Text("I confirm the documents I have uploaded are True and not Falsified", style: TextStyle(fontSize: 16)))
                    ],
                  ),
                  SizedBox( height: 20,),
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    height: 20,
                    minWidth: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.of(context).primaryColor)),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      var is_file1 = await HttpService().upload_term(file1);
                      var is_file2 = await HttpService().upload_invoice(file2);
                      var is_file3 = await HttpService().upload_manifest(file3);
                      if(is_file1 == true && is_file2 == true && is_file3 == true){
                        print('upload successful');
                        var transaction = await HttpService().transaction(widget.user!.id.toString(), company.text, routine_solution.text, transaction_date, metrics.text, amount.text, basename(file1!.path), basename(file2!.path), basename(file3!.path));
                        if(transaction == true){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationHome(widget.user, widget.toggle)));
                          await EasyLoading.showSuccess('Success');
                        }
                      } else{
                        await EasyLoading.showSuccess('Failed');
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
