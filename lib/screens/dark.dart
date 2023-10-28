import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculators/constants/colors.dart';
import 'package:calculators/cubit/numbers_cubit.dart';
import 'package:calculators/cubit/result_box_states.dart';
import 'package:calculators/widgets/number_container.dart';
import 'package:calculators/widgets/signs_container.dart';

class DarkPage extends StatelessWidget {
  const DarkPage({super.key});
  static const String id = "dark";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NumbersCubit, BoxsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Constants.backGround,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                " ${BlocProvider.of<NumbersCubit>(context).result}",
                                style: const TextStyle(
                                  fontSize: 80,
                                  color: Colors.white,
                                  fontFamily: 'Sen',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "=",
                                style: TextStyle(
                                  fontSize: 60,
                                  color: Constants.borderColor,
                                  fontFamily: 'Sen',
                                ),
                              ),
                              Text(
                                " ${BlocProvider.of<NumbersCubit>(context).operation}",
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Constants.borderColor,
                                  fontFamily: 'Sen',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(),
                        height: 500,
                        width: double.infinity,
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SignContainer(containerName: "C"),
                                  SignContainer(containerName: "+/-"),
                                  SignContainer(containerName: "%"),
                                  SignContainer(containerName: "/")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  NumberContainer(containerName: "7"),
                                  NumberContainer(containerName: "8"),
                                  NumberContainer(containerName: "9"),
                                  SignContainer(containerName: "*")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  NumberContainer(containerName: "4"),
                                  NumberContainer(containerName: "5"),
                                  NumberContainer(containerName: "6"),
                                  SignContainer(containerName: "-")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  NumberContainer(containerName: "1"),
                                  NumberContainer(containerName: "2"),
                                  NumberContainer(containerName: "3"),
                                  SignContainer(containerName: "+"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  NumberContainer(containerName: "0"),
                                  NumberContainer(containerName: "."),
                                  SignContainer(containerName: ">x<"),
                                  SignContainer(containerName: "="),
                                ],
                              ),
                            ]))
                  ]),
            ));
      },
    );
  }
}
