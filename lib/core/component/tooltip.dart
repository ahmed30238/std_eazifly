import 'package:flutter/material.dart';

class CustomTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? arrowHeight;
  final double? arrowWidth;
  final bool showArrow;
  final TooltipDirection direction;

  const CustomTooltip({
    super.key,
    required this.child,
    required this.message,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.arrowHeight = 8.0,
    this.arrowWidth = 16.0,
    this.showArrow = true,
    this.direction = TooltipDirection.top,
  });

  @override
  State<CustomTooltip> createState() => _CustomTooltipState();
}

enum TooltipDirection { top, bottom, left, right }

class _CustomTooltipState extends State<CustomTooltip>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showTooltip() {
    setState(() {
      _isVisible = true;
    });
    _animationController.forward();
  }

  void _hideTooltip() {
    _animationController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _showTooltip,
          child: widget.child,
        ),
        if (_isVisible)
          Positioned.fill(
            child: GestureDetector(
              onTap: _hideTooltip,
              child: Container(
                color: Colors.transparent,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Transform.scale(
                        scale: _animation.value,
                        child: _buildTooltip(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTooltip() {
    return CustomPaint(
      painter: TooltipPainter(
        color: widget.backgroundColor ?? Colors.black87,
        direction: widget.direction,
        arrowHeight: widget.arrowHeight ?? 8.0,
        arrowWidth: widget.arrowWidth ?? 16.0,
        showArrow: widget.showArrow,
      ),
      child: Container(
        padding: widget.padding ?? const EdgeInsets.all(12.0),
        child: Text(
          widget.message,
          style: widget.textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TooltipPainter extends CustomPainter {
  final Color color;
  final TooltipDirection direction;
  final double arrowHeight;
  final double arrowWidth;
  final bool showArrow;

  TooltipPainter({
    required this.color,
    required this.direction,
    required this.arrowHeight,
    required this.arrowWidth,
    required this.showArrow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // رسم المستطيل الأساسي
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(8.0),
    );
    path.addRRect(rect);

    // رسم السهم حسب الاتجاه
    if (showArrow) {
      switch (direction) {
        case TooltipDirection.top:
          path.moveTo(size.width / 2 - arrowWidth / 2, size.height);
          path.lineTo(size.width / 2, size.height + arrowHeight);
          path.lineTo(size.width / 2 + arrowWidth / 2, size.height);
          break;
        case TooltipDirection.bottom:
          path.moveTo(size.width / 2 - arrowWidth / 2, 0);
          path.lineTo(size.width / 2, -arrowHeight);
          path.lineTo(size.width / 2 + arrowWidth / 2, 0);
          break;
        case TooltipDirection.left:
          path.moveTo(size.width, size.height / 2 - arrowWidth / 2);
          path.lineTo(size.width + arrowHeight, size.height / 2);
          path.lineTo(size.width, size.height / 2 + arrowWidth / 2);
          break;
        case TooltipDirection.right:
          path.moveTo(0, size.height / 2 - arrowWidth / 2);
          path.lineTo(-arrowHeight, size.height / 2);
          path.lineTo(0, size.height / 2 + arrowWidth / 2);
          break;
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// مثال على الاستخدام
class TooltipExample extends StatelessWidget {
  const TooltipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tooltip Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTooltip(
              message: 'انقر هنا للحصول على المساعدة',
              backgroundColor: Colors.black87,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              direction: TooltipDirection.top,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'اضغط هنا',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // استخدام Tooltip المدمج في Flutter
            Tooltip(
              message: 'هذا tooltip بسيط',
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Tooltip مدمج',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// طريقة أخرى باستخدام Overlay
class OverlayTooltip {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void show({
    required BuildContext context,
    required String message,
    required GlobalKey key,
    Color? backgroundColor,
    TextStyle? textStyle,
  }) {
    if (_isVisible) return;

    _isVisible = true;
    final overlay = Overlay.of(context);
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    
    if (renderBox != null) {
      final size = renderBox.size;
      final offset = renderBox.localToGlobal(Offset.zero);
      
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy - 50,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message,
                style: textStyle ?? const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
      
      overlay.insert(_overlayEntry!);
      
      // إخفاء تلقائي بعد 3 ثوان
      Future.delayed(const Duration(seconds: 3), () {
        hide();
      });
    }
  }

  static void hide() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isVisible = false;
    }
  }
}