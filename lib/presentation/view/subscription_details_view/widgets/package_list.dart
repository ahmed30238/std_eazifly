import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PackageList extends StatelessWidget {
  const PackageList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SubscriptiondetailsCubit.get(context);

    return SizedBox(
      height: 217.h,
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) => ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            bool isSelected = index == cubit.selectedPackageIndex;
            return InkWell(
              onTap: () => cubit.changeselectedPackageIndex(index),
              child: PackageContainer(
                isSelected: isSelected,
              ),
            );
          },
          separatorBuilder: (context, index) => 11.pw,
          itemCount: 3,
        ),
      ),
    );
  }
}
