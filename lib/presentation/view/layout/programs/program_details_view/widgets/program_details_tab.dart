import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter_html/flutter_html.dart';

class ProgramDetailsTap extends StatelessWidget {
  final GetProgramsProgramEntity programEntity;

  const ProgramDetailsTap({super.key, required this.programEntity});

  @override
  Widget build(BuildContext context) {
    return Html(data: programEntity.content ?? "no content");
  }
}
