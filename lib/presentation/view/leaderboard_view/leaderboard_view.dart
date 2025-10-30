import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/presentation/view/leaderboard_view/widgets/competitors_list_container.dart';
import 'package:eazifly_student/presentation/view/leaderboard_view/widgets/first_places_row.dart';
import 'package:eazifly_student/presentation/view/leaderboard_view/widgets/leader_board_appbar.dart';
import 'package:flutter/material.dart';

class LeaderBoardView extends StatelessWidget {
  const LeaderBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LeaderBoardAppbar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          24.ph,
          const FirstPlacesRow(),
          const CompetitorListContainer(),
        ],
      ),
    );
  }
}
