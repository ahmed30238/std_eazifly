class AddSingleItemToFavListTojson {
  final int favouriteListId;
  final int libraryItemId;

  AddSingleItemToFavListTojson({
    required this.favouriteListId,
    required this.libraryItemId,
  });
  Map<String, dynamic> toJson() => {
        "favorite_list_id": favouriteListId,
        "library_item_id": libraryItemId,
      };
}
