import 'dart:developer';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_model.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/get_user_orders_entities.dart';
import 'package:eazifly_student/domain/use_cases/get_user_orders_usecase.dart';
import 'package:eazifly_student/presentation/controller/programs_under_review/programs_under_review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgramsUnderReviewCubit extends Cubit<ProgramsUnderReviewState> {
  ProgramsUnderReviewCubit({
    required this.getUserOrdersUsecase,
  }) : super(ProgramsUnderReviewInitial());
  static ProgramsUnderReviewCubit get(context) => BlocProvider.of(context);

  bool getUserOrdersLoader = false;
  GetUserOrdersEntity? getUserOrdersEntity;
  GetUserOrdersUsecase getUserOrdersUsecase;
  Future<void> getUserOrders() async {
    log("started");
    getUserOrdersLoader = true;
    emit(GetUserOrdersLoadingState());
    final result = await getUserOrdersUsecase.call(
      parameter: NoParameter(),
    );
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
        // specificOrder(orderId: 15);
        emit(GetUserOrdersSuccessState());
      },
    );
  }

  CreateOrderDataEntity? myOrder;
  // في ProgramsUnderReviewCubit
// CreateOrderDataModel? myOrder;

  specificOrder({required int orderId}) {
    try {
      // تحقق من وجود الداتا أولاً
      if (getUserOrdersEntity?.data == null ||
          getUserOrdersEntity!.data!.isEmpty) {
        log("No orders data available");
        myOrder = null;
        return;
      }

      // دور على الـ order
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
      } else {
        log("Order with ID $orderId not found in the list");
      }

      // emit state للتحديث
      emit(OrderSelectedState()); // أضف هذا الـ state جديد
    } catch (e) {
      log("Error in specificOrder: $e");
      myOrder = null;
    }
  }
}
