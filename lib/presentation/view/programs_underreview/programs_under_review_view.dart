import 'dart:developer';

import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_cubit.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_state.dart';
import 'package:eazifly_student/presentation/view/programs_underreview/widgets/under_review_item.dart';
import 'package:eazifly_student/presentation/view/programs_underreview/widgets/under_review_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramsUnderReviewView extends StatefulWidget {
  const ProgramsUnderReviewView({super.key});

  @override
  State<ProgramsUnderReviewView> createState() =>
      _ProgramsUnderReviewViewState();
}

class _ProgramsUnderReviewViewState extends State<ProgramsUnderReviewView> {
  late ProgramsUnderReviewCubit cubit;
  @override
  void initState() {
    cubit = ProgramsUnderReviewCubit.get(context);
    cubit.getUserOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "برامج في المراجعة",
        leadingText: lang.myPrograms,
        isCenterTitle: true,
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (cubit.getUserOrdersLoader) {
            return const UnderReviewLoader();
          }

          if (state is GetUserOrdersErrorState) {
            return Center(child: Text(state.errorMessage));
          }

          var orders = cubit.getUserOrdersEntity?.data;

          if (orders == null || orders.isEmpty) {
            return const Center(child: Text('No orders found'));
          }

          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (context, index) {
              var order = orders[index];
              log("${order.orderDetails?[0].label}");
              return UnderReviewItem(
                image: "",
                state: order.status?.color ?? "",
              );
            },
            itemCount: orders.length,
            separatorBuilder: (context, index) => 24.ph,
          );
        },
      ),
    );
  }
}

var programTitles = [
  "عدد البرامج",
  "سعر المجموعة ",
  "تاريخ البدء",
];
