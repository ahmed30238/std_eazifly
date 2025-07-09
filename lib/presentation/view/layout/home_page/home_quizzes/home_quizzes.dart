import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class HomeQuizzes extends StatefulWidget {
  const HomeQuizzes({super.key});

  @override
  State<HomeQuizzes> createState() => _HomeQuizzesState();
}

class _HomeQuizzesState extends State<HomeQuizzes> {
  late HomeCubit cubit;
  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    super.initState();
    cubit.getHomeQuizzes();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}