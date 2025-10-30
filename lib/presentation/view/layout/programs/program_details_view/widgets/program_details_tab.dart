import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProgramDetailsTap extends StatefulWidget {
  final GetProgramsProgramEntity programEntity;

  const ProgramDetailsTap({super.key, required this.programEntity});

  @override
  State<ProgramDetailsTap> createState() => _ProgramDetailsTapState();
}

class _ProgramDetailsTapState extends State<ProgramDetailsTap> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // إنشاء controller للـ WebView
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // يمكنك إضافة loading indicator هنا
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadHtmlString(_buildHtmlContent());
  }

  // دالة لإنشاء HTML كامل مع CSS
  String _buildHtmlContent() {
    final content = widget.programEntity.content ?? "no content";

    return '''
    <!DOCTYPE html>
    <html dir="rtl" lang="ar">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: 'Cairo', 'Tajawal', 'Amiri', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                margin: 16px;
                padding: 0;
                line-height: 1.8;
                color: #333;
                direction: rtl;
                text-align: right;
            }
            p, div, span, h1, h2, h3, h4, h5, h6 {
                direction: rtl;
                text-align: right;
                unicode-bidi: embed;
            }
            img {
                max-width: 100%;
                height: auto;
            }
            * {
                box-sizing: border-box;
            }
            /* إضافة دعم للخطوط العربية من Google Fonts */
            @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@200..1000&display=swap');
        </style>
    </head>
    <body>
        $content
    </body>
    </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
