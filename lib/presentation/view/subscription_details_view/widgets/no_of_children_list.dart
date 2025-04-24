import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NoOfChildrenList extends StatelessWidget {
  const NoOfChildrenList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SubscriptiondetailsCubit.get(context);
    return SizedBox(
      height: 48.h,
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isSelected = index == cubit.noOfChildrenIndex;
            return InkWell(
              onTap: () => cubit.changeNoOfChildrenIndex(index),
              child: NoOfChildrenContainer(
                isSelected: isSelected,
                index: index,
              ),
            );
          },
          separatorBuilder: (context, index) => 8.pw,
          itemCount: 4,
        ),
      ),
    );
  }
}
