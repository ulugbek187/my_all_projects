import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/bloc/country/country_cubit.dart';
import 'package:my_all_projects/bloc/country/country_state.dart';
import 'package:my_all_projects/data/models/forms_status.dart';
import 'package:my_all_projects/data/models/payment_model.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Payment",
            style: AppTextStyle.interBold.copyWith(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            if (state.formsStatus == FormsStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.formsStatus == FormsStatus.error) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.statusText),
                ],
              );
            }
            return ListView(
              children: [
                ...List.generate(
                  state.countries.length,
                  (index) {
                    PaymentModel countries = state.countries[index];
                    return Container(
                      margin: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        bottom: 15,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {},
                        leading: Text(
                          countries.code.toString(),
                          style: const TextStyle(fontSize: 35),
                        ),
                        title: Text(
                          countries.title.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          countries.date.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Text(
                          countries.nbuCellPrice.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
