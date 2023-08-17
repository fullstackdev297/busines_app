import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/business.dart';
import '../service/http_service.dart';
import 'business_detail.dart';

const List<String> list = <String>['Business Name', 'Phone Number', 'License State'];

class SearchBusiness extends StatefulWidget {
  const SearchBusiness({Key? key}) : super(key: key);

  @override
  State<SearchBusiness> createState() => _SearchBusinessState();
}

class _SearchBusinessState extends State<SearchBusiness> {

  late String search_by, search_name;
  String dropdownValue = list.first;
  List<Business>? businesses;
  bool isLoading = true;

  @override
  void initState() {
    search_by = 'business_name';
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        contentPadding: EdgeInsets.all(10)),
                    onChanged: (value){
                      setState(() {
                        search_name = value;
                      });
                    },
                  ),
                ),
                SizedBox( height: 20,),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.75,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          color: Colors.grey[100],
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                              if(dropdownValue == 'Business Name'){
                                search_by = 'business_name';
                              } else if(dropdownValue == 'Phone Number'){
                                search_by = 'phone_number';
                              } else{
                                search_by = 'license_state';
                              }
                            });
                          },
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox( width: 20,),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5))),
                      child: InkWell(
                          onTap: () async {
                            print(search_by);
                            print(search_name);
                            businesses = await HttpService().search_business(search_by, search_name);
                            setState(() {
                              if(businesses != null){
                                isLoading = false;
                                print(businesses?.length);
                              }
                            });
                          },
                          child: Icon(Icons.search, color: AppTheme.nearlyWhite,)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                isLoading ? Container() : Flexible(
                  child: ListView.builder(
                      itemCount: businesses?.length,
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
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: Image.asset('assets/images/documents.png'),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*0.5,
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(businesses![index].companyName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(height: 20,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Text("Grade:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                          SizedBox(width: 10,),
                                          Text(businesses![index].score, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    MaterialButton(
                                      color: Theme.of(context).primaryColor,
                                      height: 16,
                                      minWidth: double.infinity,
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: BorderSide(color: Theme.of(context).primaryColor)),
                                      child: Text(
                                        "More Info",
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context)=>BusinessDetail(businesses![index])
                                        ));
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
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