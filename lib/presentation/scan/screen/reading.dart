import 'package:ddverse/bloc/reading_bloc/bloc/reading_bloc.dart';
import 'package:ddverse/core/services/size_service/size_service.dart';
import 'package:ddverse/core/ui_component/loadingbutton.dart';
import 'package:ddverse/model/reading.dart';
import 'package:ddverse/presentation/auth/screen/user_info.dart';
import 'package:ddverse/presentation/scan/widget/card.dart';
import 'package:ddverse/presentation/scan/widget/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Reading extends StatefulWidget {
  static const routeName = "/reading";
  const Reading({super.key});

  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  @override
  void initState() {
    super.initState();
    print("INSIDE INIT");
    context.read<ReadingBloc>().add(GetAllReportsEvent());
  }

  void _scanNewReading() {
    context.read<ReadingBloc>().add(TakeReadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(UserInfo.routeName);
            },
            icon: const Icon(Icons.person, size: 25),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ReadingBloc, ReadingState>(
              builder: (context, state) {
                if (state is ReadingLoadingState) {
                  return Lottie.asset("assets/loading.json", height: 500);
                } else if (state is ReadingErrorState) {
                  return Center(child: Text("Error: ${state.errorMessage}"));
                } else if (state is ReadingDataState) {
                  return StreamBuilder<List<TestReading>>(
                    stream: state.data,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: SizeService.height(context) * 0.7,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        print("Error: ${snapshot.error}");
                        return Center(child: Text("Error: ${snapshot.error}"));
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return SizedBox(
                          height: SizeService.height(context) * 0.7,
                          child: const Center(child: Text("No readings yet")),
                        );
                      }

                      final readings = snapshot.data!;
                      print("UI READINGS COUNT: ${readings.length}");

                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          spacing: 16,
                          children: [
                            BuildCard(latestReading: readings[0]),
                            SizedBox(
                              height: 400,
                              child: BuildChart(readings: readings),
                            ),
                            Text(
                              "Note: The chart shows the last 5 readings only",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.show_chart, color: Colors.red),
                                SizedBox(width: 4),
                                Text("Temperature"),
                                SizedBox(width: 16),
                                Icon(Icons.show_chart, color: Colors.blue),
                                SizedBox(width: 4),
                                Text("Moisture"),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return SizedBox(
                  height: SizeService.height(context) * 0.7,
                  child: const Center(child: Text("No readings yet")),
                );
              },
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        BlocBuilder<ReadingBloc, ReadingState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child:
                  state is ReadingLoadingState
                      ? buildLoadingButton(
                        SizeService.height(context) * 1,
                        SizeService.height(context) * 0.0747,
                      )
                      : ElevatedButton.icon(
                        onPressed: _scanNewReading,
                        icon: const Icon(Icons.speed, size: 26),
                        label: Text(
                          "Take reading",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: Colors.white),
                        ),
                      ),
            );
          },
        ),
      ],
    );
  }
}
