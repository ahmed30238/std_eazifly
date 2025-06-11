import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_state.dart';
import 'package:eazifly_student/presentation/view/layout/library/audio_playlist_view/widgets/telegram_style_file_item.dart';
import 'package:eazifly_student/presentation/view/layout/library/widgets/library_fav_list_item_shimmer.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AudioPlayListView extends StatefulWidget {
  final int listId;
  const AudioPlayListView({
    super.key,
    required this.listId,
  });

  @override
  State<AudioPlayListView> createState() => _AudioPlayListViewState();
}

class _AudioPlayListViewState extends State<AudioPlayListView> {
  late LibraryCubit cubit;

  @override
  void initState() {
    cubit = context.read<LibraryCubit>();
    super.initState();
    cubit.getListItemsUsingListId(
      listId: widget.listId,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "الملفات",
        leadingText: lang.library,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          24.ph,
          Text(
            "قائمة الملفات",
            style: MainTextStyle.boldTextStyle(
              fontSize: 18,
            ),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (cubit.getListItemsLoader) {
                return const FavItemShimmerList();
              }

              if (state is GetListItemsErrorState) {
                return Center(child: Text(state.errorMessage));
              }

              var audioPlaylist = cubit.getListItemsUsingListIdEntity?.data;

              if (audioPlaylist == null || audioPlaylist.isEmpty) {
                return const NoDataAnimatedImageWidget(message: "لا يوجد ملفات")
                    .center();
              }

              return Expanded(
                child: ListView.separated(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  itemBuilder: (context, index) {
                    var audioPlayListItem = audioPlaylist[index];
                    var fileType = audioPlayListItem.fileType ?? "";
                    var fileUrl = audioPlayListItem.file ?? "";
                    var title = audioPlayListItem.title ?? "ملف بدون عنوان";
                    var image = audioPlayListItem.image ?? "ملف بدون صورة";
                    var isPaid = audioPlayListItem.paymentType == "paid";
                    Color fileColor;

                    switch (fileType.toLowerCase()) {
                      case 'pdf':
                        fileColor = Colors.red;
                        break;
                      case 'txt':
                        fileColor = Colors.blue;
                        break;
                      default:
                        fileColor = Colors.grey;
                    }

                    return TelegramStyleFileItem(
                      isPaid: isPaid,
                      title: title,
                      fileType: fileType.toUpperCase(),
                      image: image,
                      fileColor: fileColor,
                      isDownloading: cubit.isDownloading[fileUrl] ?? false,
                      downloadProgress:
                          cubit.downloadingProgress[fileUrl] ?? 0.0,
                      isDownloaded: cubit.downloadedFiles.containsKey(fileUrl),
                      onTap: isPaid
                          ? () {
                              delightfulToast(
                                  message: "ليس لديك اشتراك", context: context);
                            }
                          : () {
                              if (fileUrl.isNotEmpty) {
                                cubit.openFile(
                                    fileUrl: fileUrl,
                                    fileType: fileType,
                                    title: title,
                                    context: context);
                              } else {
                                cubit.showErrorSnackBar(
                                    'رابط الملف غير متوفر', context);
                              }
                            },
                    );
                  },
                  separatorBuilder: (context, index) => 12.ph,
                  itemCount: audioPlaylist.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
