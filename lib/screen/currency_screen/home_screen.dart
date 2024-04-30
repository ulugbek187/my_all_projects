import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:my_all_projects/screen/bloc/currency_bloc.dart';
import 'package:my_all_projects/screen/bloc/currency_event.dart';
import 'package:my_all_projects/screen/bloc/currency_state.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CurrencyBloc, CurrencyState>(
        builder: (BuildContext context, CurrencyState state) {
          if (state is CurrencyInitialState) {
            return const Center(
              child: SizedBox(),
            );
          }
          if (state is CurrencySuccessState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.grey),
                  child: ListTile(
                    title: Text(
                      state.data[index].title,
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          state.data[index].code,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          state.data[index].cbPrice,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    leading: Text(state.data[index].date.toString()),
                  ),
                );
              },
            );
          }
          if (state is CurrencyNetworkState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CurrencyBloc>().add(GetNetworkCurrencyEvent());
                },
                child: const Text('Refresh'),
              ),
            );
          }
          return Center(
            child: Lottie.asset('assets/lottie/loading.json'),
          );
        },
        listener: (BuildContext context, CurrencyState state) {
          debugPrint("___________________________state $state");
          if (state is CurrencyNetworkState) {
            if (state.isLocal) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: const Text('No internet connection'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Ok'),
                        ),
                      ],
                    );
                  });
            } else {
              context.read<CurrencyBloc>().add(GetLocalCurrencyEvent());
            }
          }
        },
      ),
    );
  }
}
