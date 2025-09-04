import 'package:ddverse/bloc/reading_bloc/bloc/reading_bloc.dart';
import 'package:ddverse/model/reading.dart';
import 'package:ddverse/presentation/history/widget/card_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    super.initState();
    print("INSIDE INIT");
    context.read<ReadingBloc>().add(GetAllReportsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reports")),
      body: BlocBuilder<ReadingBloc, ReadingState>(
        builder: (context, state) {
          if (state is ReadingLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReadingErrorState) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          } else if (state is ReadingDataState) {
            return StreamBuilder<List<TestReading>>(
              stream: state.data,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  print("Error: ${snapshot.error}");
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No readings yet"));
                }

                final readings = snapshot.data!;
                print("UI READINGS COUNT: ${readings.length}");

                return ListView.builder(
                  itemCount: readings.length,
                  itemBuilder: (context, idx) {
                    return CardTitle(reading: readings[idx]);
                  },
                );
              },
            );
          }
          return const Center(child: Text("No readings yet"));
        },
      ),
    );
  }
}
