import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/screens/timer/time_task_screen.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';
import '../../cubits/timer/time_state_cubit.dart';
import '../../cubits/timer/time_task_cubit.dart';

class StartTaskScreen extends StatefulWidget {
  const StartTaskScreen({super.key});

  @override
  State<StartTaskScreen> createState() => _StartTaskScreenState();
}

class _StartTaskScreenState extends State<StartTaskScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<TimeCubit>().startTime();
    });
    super.initState();
  }
  bool isCancel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            isCancel
                ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TimeTaskScreen()))
                : ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'ВЫ НЕ МОЖЕТЕ ЗАКРЫТЬ ЭКРАН!!!',
                  style: AppTextStyle.interBold.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text("Экран времени", style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 32,
        ),),
      ),
      body: BlocBuilder<TimeCubit, TimeState>(
        builder: (BuildContext context, TimeState state) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Название упражнение: ${state.taskName}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: CircularProgressIndicator(
                        value: state.progressValue,
                        color: Colors.black,
                        backgroundColor: Colors.grey,
                        strokeWidth: 8,
                      ),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 125,
                      child: RichText(
                        text: TextSpan(
                          text: state.hour.toString().length == 1
                              ? "0${state.hour.toString()}"
                              : state.hour.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                          children: [
                            TextSpan(
                                text: state.minute.toString().length == 1
                                    ? " : 0${state.minute.toString()} : "
                                    : " : ${state.minute.toString()} : ",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40)),
                            TextSpan(
                              text: state.second.toString().length == 1
                                  ? "0${state.second.toString()}"
                                  : state.second.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Нажмите финишь чтоб зактрыть экран, финишь выйдет после окончания времени',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (state.finishTime)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCancel = true;
                          });
                          context.read<TimeCubit>().finishTaskTime();
                          isCancel ? ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                'ВЫ МОЖЕТЕ ЗАКРЫТЬ ЭКРАН!!!',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                           : ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'ВЫ НЕ МОЖЕТЕ ЗАКРЫТЬ ЭКРАН!!!',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );

                        },
                        child: const Text(
                          'Финишь',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
