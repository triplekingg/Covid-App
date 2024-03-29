import 'package:covidapp/screens/dailycasesPage.dart';
import 'package:covidapp/screens/infopage.dart';
import 'package:covidapp/screens/isolation.dart';
import 'package:covidapp/screens/reminderpage.dart';
import 'package:covidapp/widgets/DaysLeft.dart';
import 'package:covidapp/widgets/ScrollableRowIcons.dart';
import 'package:covidapp/widgets/dailycases.dart';
import 'package:covidapp/widgets/duration.dart';
import 'package:covidapp/widgets/durationText.dart';
import 'package:covidapp/widgets/BannerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:covidapp/api/api_service_cases.dart';
import 'package:covidapp/models/CaseModels.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late List<CaseModel>? _caseModel = []; //empty for now

class _HomePageState extends State<HomePage> {
  var formatter = NumberFormat('#,##,000');
  @override
  void initState() {
    super.initState();
    _getData();
  }

//function to get data from api service
  void _getData() async {
    _caseModel = (await ApiService().getCases())!;

    // Simulate QUERY time for the real API call
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {}));
  }

  void action() {
    print('object');
  }

  void DailyScreen() {
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 249, 255),
        appBar: AppBar(
          title: Text(
            "Home",
            style: GoogleFonts.archivoBlack(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 242, 249, 255),
          elevation: 0,
        ),
        body: _caseModel == null || _caseModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Column(
                    children: [
                      Center(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 10),
                            child: DailyCases(
                                formatter.format(_caseModel![0].newCase)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomButtonIcon(
                                        'assets/images/information.png',
                                        'Information', () {
                                      Get.to(InfoScreen());
                                    }),
                                    CustomButtonIcon(
                                        'assets/images/medicine.png',
                                        'Reminder',
                                        () => Get.to(ReminderPage())),
                                  ]),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: bannerWidget('assets/images/covid-bg.png',
                                  'Enter Quarantine', () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IsolationPage()));
                              })),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: bannerWidget('assets/images/covid-bg.png',
                                'Detailed Daily Cases', (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DailyCasesPage()));
                            })),
                          ),
                        ],
                      ))
                    ],
                  ),
                ],
              )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
