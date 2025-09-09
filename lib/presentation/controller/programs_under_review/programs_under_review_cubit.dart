import 'dart:developer';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_model.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/get_user_orders_entities.dart';
import 'package:eazifly_student/domain/use_cases/get_user_orders_usecase.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgramsUnderReviewCubit extends Cubit<ProgramsUnderReviewState> {
  ProgramsUnderReviewCubit({required this.getUserOrdersUsecase})
    : super(ProgramsUnderReviewInitial());

  static ProgramsUnderReviewCubit get(context) => BlocProvider.of(context);

  bool getUserOrdersLoader = false;
  GetUserOrdersEntity? getUserOrdersEntity;
  GetUserOrdersUsecase getUserOrdersUsecase;

  Future<void> getUserOrders() async {
    log("started");
    getUserOrdersLoader = true;
    emit(GetUserOrdersLoadingState());
    final result = await getUserOrdersUsecase.call(parameter: NoParameter());
    result.fold(
      (l) {
        log("error");

        getUserOrdersLoader = false;
        emit(GetUserOrdersErrorState(errorMessage: l.message));
      },
      (r) {
        log("success");

        getUserOrdersLoader = false;
        log("${r.message}");
        getUserOrdersEntity = r;
        emit(GetUserOrdersSuccessState());
      },
    );
  }

  CreateOrderDataEntity? myOrder;
  List<CreateOrderOrderNoteEntity>? orderMessages = [];

  specificOrder({required int orderId}) {
    try {
      orderMessages = [];
      if (getUserOrdersEntity?.data == null ||
          getUserOrdersEntity!.data!.isEmpty) {
        log("No orders data available");
        myOrder = null;
        return;
      }

      myOrder = getUserOrdersEntity?.data?.firstWhere(
        (element) => element.id == orderId,
        orElse: () {
          log("Order with ID $orderId not found");
          return CreateOrderDataModel();
        },
      );

      if (myOrder != null) {
        log("Order found: ${myOrder?.orderDetails?.last.title}");
        log("Order notes count: ${myOrder?.orderNotes?.length}");
        orderMessages?.addAll(myOrder?.orderNotes ?? []);
      } else {
        log("Order with ID $orderId not found in the list");
      }

      emit(OrderSelectedState());
    } catch (e) {
      log("Error in specificOrder: $e");
      myOrder = null;
    }
  }
}
