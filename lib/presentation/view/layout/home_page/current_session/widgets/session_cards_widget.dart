// session_cards_widget.dart
import 'package:eazifly_student/presentation/controller/home_controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'session_card_item.dart';

class SessionCardsWidget extends StatelessWidget {
  final HomeCubit cubit;
  final List<String> stdTitleList;

  const SessionCardsWidget({
    super.key,
    required this.cubit,
    required this.stdTitleList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        // Loading state check
        if (cubit.getHomeCurrentSessionLoader ||
            cubit.getHomeCurrentSessionEntity == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final sessionData = cubit.getHomeCurrentSessionEntity?.data;
        if (sessionData == null) {
          return const SizedBox.shrink();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => SessionCardItem(
              index: index,
              sessionData: sessionData,
              title: stdTitleList[index],
              cubit: cubit,
            ),
          ),
        );
      },
    );
  }
}
