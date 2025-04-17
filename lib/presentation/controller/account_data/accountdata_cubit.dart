import 'dart:io';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/controller/account_data/accountdata_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountdataCubit extends Cubit<AccountdataState> {
  AccountdataCubit() : super(AccountdataInitial());
  static AccountdataCubit get(context) => BlocProvider.of(context);
  File? profileImage;
  Future<void> pickProfileImageFroGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      profileImage = File(response.path);
    }
    emit(PickImageFromGallerySuccessState());
  }
}
