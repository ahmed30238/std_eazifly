import 'package:eazifly_student/data/models/home/get_home_library_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetHomeLibraryEntity {
  @JsonKey(name: "data")
  List<GetHomeLibraryDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetHomeLibraryEntity({this.data, this.status, this.message});
}

class GetHomeLibraryDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "items")
  GetHomeLibraryItemsModel? items;

  GetHomeLibraryDatumEntity({
    this.id,
    this.title,
    this.type,
    this.createdAt,
    this.items,
  });
}

class GetHomeLibraryItemsEntity {
  @JsonKey(name: "data")
  List<GetHomeLibraryItemsDatumModel>? data;
  @JsonKey(name: "meta")
  GetHomeLibraryMetaModel? meta;

  GetHomeLibraryItemsEntity({this.data, this.meta});
}

class GetHomeLibraryItemsDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "file")
  String? file;
  @JsonKey(name: "file_type")
  String? fileType;
  @JsonKey(name: "library_list_id")
  String? libraryListId;
  @JsonKey(name: "payment_type")
  String? paymentType;
  @JsonKey(name: "item_type")
  String? itemType;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "liked")
  bool? liked;

  GetHomeLibraryItemsDatumEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.file,
    this.fileType,
    this.libraryListId,
    this.paymentType,
    this.itemType,
    this.createdAt,
    this.liked,
  });
}

class GetHomeLibraryMetaEntity {
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "total")
  int? total;

  GetHomeLibraryMetaEntity({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });
}
