import 'package:eazifly_student/presentation/controller/meetings_controller/meeting_state.dart';
import 'package:eazifly_student/presentation/view/home_meetings_view/widgets/all_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeetingCubit extends Cubit<MeetingState> {
  MeetingCubit() : super(MeetingInitial());
  static MeetingCubit get(context) => BlocProvider.of(context);

  late TabController tabController;
  void initController(TickerProvider vsync) {
    tabController = TabController(length: 3, vsync: vsync)
      ..addListener(
        () {
          if (tabController.indexIsChanging) {
            emit(ChangeTabControllerIndexState());
            tabController.animateTo(tabController.index);
          }
        },
      );
    emit(InitTabControllerState());
  }

  List<String> tabs(BuildContext context) {
    var tabs = [
      "الكل",
      "قادمة",
      "مسجلة",
    ];
    return tabs;
  }

  var screens = [
    //! first body
    const AllItemsList(),
    ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Center(child: Text("No Data")),
      itemCount: 1,
    ),
    const Center(child: Text("No Data")),
  ];
}
