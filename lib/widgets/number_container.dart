import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculators/constants/colors.dart';
import 'package:calculators/cubit/numbers_cubit.dart';

class NumberContainer extends StatelessWidget {
  const NumberContainer({
    super.key,
    required this.containerName,
  });

  final String containerName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
   
      onTap: () {
        BlocProvider.of<NumbersCubit>(context).operationText(containerName);
      },
      child: Container(
        height: 77,
        width: 77,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Constants.containersColor,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: .1,
                blurRadius: 10,
                offset: const Offset(-10, -8),
                // changes position of shadow
              ),
            ]),
        child: Center(
          child: Text(
            containerName,
            style: const TextStyle(
              fontSize: 29,
              color: Colors.white,
              fontFamily: 'Sen',
            ),
          ),
        ),
      ),
    );
  }
}
