import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_all_projects/screens/timer/time_screen.dart';
import 'package:my_all_projects/utils/styles/app_text_style.dart';
import '../../cubits/timer/time_task_cubit.dart';

class TimeTaskScreen extends StatefulWidget {
  const TimeTaskScreen({super.key});

  @override
  State<TimeTaskScreen> createState() => _TimeTaskScreenState();
}

class _TimeTaskScreenState extends State<TimeTaskScreen> {
  TimeOfDay? timeOfDay;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
          title: Text(
            "Добавьте время",
            style: AppTextStyle.interBold.copyWith(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        IconButton(
                          onPressed: () async {
                            timeOfDay = await showTimePicker(
                              context: context,
                              initialEntryMode: TimePickerEntryMode.input,
                              initialTime: const TimeOfDay(hour: 0, minute: 0),
                              builder: (BuildContext context, Widget? child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: true),
                                  child: child!,
                                );
                              },
                            );
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.timelapse,
                            size: 200,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          timeOfDay.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Пожалуйста напишите название";
                            }
                            return null;
                          },
                          controller: _taskController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Название',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Ink(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate() &&
                          timeOfDay != null) {
                        if (!context.mounted) return;
                        context.read<TimeTaskCubit>().addHourMinute(
                            hour: timeOfDay!.hour,
                            minute: timeOfDay!.minute,
                            taskName: _taskController.text);
                        debugPrint(
                            "---------------------------hour: ${context.read<TimeTaskCubit>().state.hour}");
                        debugPrint(
                            "---------------------------minute: ${context.read<TimeTaskCubit>().state.minute}");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StartTaskScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Ошибка",
                              style: AppTextStyle.interBold
                                  .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Center(
                      child: Text(
                        'Начать',
                        style: AppTextStyle.interBold.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
