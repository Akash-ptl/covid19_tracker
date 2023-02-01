import 'package:covid19/model/summary.dart';
import 'package:covid19/services/http_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService httpService = HttpService();

  @override
  void initState() {
    super.initState();
    httpService.getsummary();
    httpService.getcountrylist();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Covid-19 '),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: httpService.getsummary(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Global summary = snapshot.data;
                  return Center(
                    child: Column(
                      children: [
                        const Text(
                          'As of Date ',
                          style: TextStyle(color: Colors.red),
                        ),
                        Text(
                          '${summary.date!.year} - ${summary.date!.month} - ${summary.date!.day}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Text('Total Cases',
                            style:
                                TextStyle(fontSize: 40, color: Colors.green)),
                        Text('${summary.totalConfirmed}',
                            style: const TextStyle(fontSize: 25)),
                        const Text('Total Deaths',
                            style: TextStyle(fontSize: 40, color: Colors.red)),
                        Text('${summary.totalDeaths}',
                            style: const TextStyle(fontSize: 25)),
                        const Text('Total Recovered',
                            style: TextStyle(
                              fontSize: 40,
                            )),
                        Text('${summary.totalRecovered}',
                            style: const TextStyle(fontSize: 25)),
                        const Text('New Confirmed',
                            style:
                                TextStyle(fontSize: 40, color: Colors.green)),
                        Text('${summary.newConfirmed}',
                            style: const TextStyle(fontSize: 25)),
                        const Text('New Deaths',
                            style: TextStyle(fontSize: 40, color: Colors.red)),
                        Text('${summary.newDeaths}',
                            style: const TextStyle(fontSize: 25)),
                        const Text('New Recovered',
                            style: TextStyle(
                              fontSize: 40,
                            )),
                        Text('${summary.newRecovered}',
                            style: const TextStyle(fontSize: 25)),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            // FutureBuilder(
            //   future: httpService.getcountrylist(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasData) {
            //       List<Welcome> country = snapshot.data;
            //       return SizedBox(
            //         height: 500,
            //         child: ListView.builder(
            //           itemCount: country.length,
            //           itemBuilder: (context, index) =>
            //               Text(country[index].country!),
            //         ),
            //       );
            //     } else {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
          ],
        ),
      ),
      // Padding(
      //     padding: const EdgeInsets.all(15),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         const Text('As of Date '),
      //         Text(
      //             '${summary.date!.year} - ${summary.date!.month} - ${summary.date!.day}'),
      //         const Text('Total Cases'),
      //         Text('${summary.totalConfirmed}'),
      //         const Text('Total Deaths'),
      //         Text('${summary.totalDeaths}'),
      //         const Text('Total Recovered'),
      //         Text('${summary.totalRecovered}'),
      //         const Text('New Confirmed'),
      //         Text('${summary.newConfirmed}'),
      //         const Text('New Deaths'),
      //         Text('${summary.newDeaths}'),
      //         const Text('New Recovered'),
      //         Text('${summary.newRecovered}'),
      //       ],
      //     )
      //     // ListView.builder(
      //     //   itemCount: country.length,
      //     //   itemBuilder: (context, index) => Text(data[index].country!),
      //     // ),
      //     ),
    ));
  }
}

class Currency {
  String currency_name;
  Icon currency_logo;
  Currency(
    this.currency_name,
    this.currency_logo,
  );
}
