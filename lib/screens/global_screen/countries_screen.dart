import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_all_projects/data/queries/country_queris.dart';
import 'package:my_all_projects/screens/global_screen/widgets/container.dart';
import 'package:my_all_projects/screens/global_screen/widgets/text_field.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';
import '../../blocs/countries_bloc.dart';
import '../../utils/colors/app_colors.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  String title = 'ALL';
  String searchText = '';
  final FocusNode focusNode = FocusNode();
  int activeIndex = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          "$title Countries",
          style: AppTextStyle.interBold,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 20.w,
            ),
            child: MyTextField(
              onChanged: (String value) {
                searchText = value;
                textEditingController.text = value;
                setState(
                  () {},
                );
              },
              controller: textEditingController,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
              horizontal: 10.w,
            ),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  continents.length,
                      (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Ink(
                      height: 50.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color:
                        activeIndex == index ? Colors.green : Colors.black,
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          context.read<CountriesBloc>().add(
                            FetchCountriesEvent(
                              continentCodes[index],
                            ),
                          );
                          setState(() {
                            title = continents[index];
                            activeIndex = index;
                          });
                        },
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            child: Text(
                              continents[index],
                              textAlign: TextAlign.center,
                              style: AppTextStyle.interBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CountriesBloc, CountriesState>(
              builder: (context, state) {
                if (state is CountriesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CountriesErrorState) {
                  return Center(child: Text(state.errorMessage));
                }

                if (state is CountriesSuccessState) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    children: [
                      ...List.generate(
                        state.countries.length,
                        (index) {
                          final country = state.countries[index];
                          if (country.name
                              .toLowerCase()
                              .contains(searchText.toLowerCase())) {
                            return MyContainer(countryModel: country);
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
