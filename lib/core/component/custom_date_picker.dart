import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:flutter/material.dart';

import '../theme/colors/main_colors.dart';

class CustomCalendar {
  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    String? title,
    String? confirmText,
    String? cancelText,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    SelectableDayPredicate? selectableDayPredicate,
    String? helpText,
    String? cancelTooltip,
    String? confirmTooltip,
    Locale? locale,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TextDirection? textDirection,
    TransitionBuilder? builder,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
  }) async {
    return await showDialog<DateTime>(
      context: context,
      barrierDismissible: true,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (BuildContext context) {
        return CustomCalendarDialog(
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate,
          lastDate: lastDate,
          title: title ?? 'اختر التاريخ',
          confirmText: confirmText ?? 'تأكيد',
          cancelText: cancelText ?? 'إلغاء',
          initialEntryMode: initialEntryMode,
          selectableDayPredicate: selectableDayPredicate,
          helpText: helpText,
          cancelTooltip: cancelTooltip,
          confirmTooltip: confirmTooltip,
          initialDatePickerMode: initialDatePickerMode,
          errorFormatText: errorFormatText,
          errorInvalidText: errorInvalidText,
          fieldHintText: fieldHintText,
          fieldLabelText: fieldLabelText,
        );
      },
    );
  }
}

class CustomCalendarDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final String title;
  final String confirmText;
  final String cancelText;
  final DatePickerEntryMode initialEntryMode;
  final SelectableDayPredicate? selectableDayPredicate;
  final String? helpText;
  final String? cancelTooltip;
  final String? confirmTooltip;
  final DatePickerMode initialDatePickerMode;
  final String? errorFormatText;
  final String? errorInvalidText;
  final String? fieldHintText;
  final String? fieldLabelText;

  const CustomCalendarDialog({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.title,
    required this.confirmText,
    required this.cancelText,
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.selectableDayPredicate,
    this.helpText,
    this.cancelTooltip,
    this.confirmTooltip,
    this.initialDatePickerMode = DatePickerMode.day,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
  }) : super(key: key);

  @override
  State<CustomCalendarDialog> createState() => _CustomCalendarDialogState();
}

class _CustomCalendarDialogState extends State<CustomCalendarDialog>
    with TickerProviderStateMixin {
  late DateTime selectedDate;
  late DatePickerEntryMode entryMode;
  late DatePickerMode currentMode;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late TextEditingController _textController;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    entryMode = widget.initialEntryMode;
    currentMode = widget.initialDatePickerMode;
    _textController = TextEditingController(text: _formatDateForInput(selectedDate));

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
                decoration: BoxDecoration(
                  color: MainColors.surface2,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: MainColors.primary.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 40,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(),
                    Flexible(child: _buildBody()),
                    _buildActions(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MainColors.primary,
            MainColors.accent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.helpText ?? widget.title,
                style: TextStyle(
                  color: MainColors.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  _buildModeToggle(Icons.edit_calendar, DatePickerEntryMode.input),
                  const SizedBox(width: 8),
                  _buildModeToggle(Icons.calendar_today, DatePickerEntryMode.calendar),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (entryMode == DatePickerEntryMode.calendar) ...[
            Text(
              _formatDate(selectedDate),
              style: TextStyle(
                color: MainColors.onPrimary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildYearMonthSelector(),
          ],
        ],
      ),
    );
  }

  Widget _buildModeToggle(IconData icon, DatePickerEntryMode mode) {
    final isActive = entryMode == mode;
    return GestureDetector(
      onTap: () {
        setState(() {
          entryMode = mode;
          if (mode == DatePickerEntryMode.input) {
            _textController.text = _formatDateForInput(selectedDate);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? MainColors.onPrimary.withValues(alpha: 0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: MainColors.onPrimary,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildYearMonthSelector() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              currentMode = currentMode == DatePickerMode.year
                  ? DatePickerMode.day
                  : DatePickerMode.year;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: MainColors.onPrimary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              currentMode == DatePickerMode.year
                  ? '${selectedDate.year}'
                  : _getMonthName(selectedDate.month),
              style: TextStyle(
                color: MainColors.onPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    if (entryMode == DatePickerEntryMode.input) {
      return _buildInputMode();
    } else {
      return _buildCalendarMode();
    }
  }

  Widget _buildInputMode() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: widget.fieldLabelText ?? 'أدخل التاريخ',
              hintText: widget.fieldHintText ?? 'dd/mm/yyyy',
              errorText: _errorText,
              border: OutlineInputBorder(
                borderRadius: 12.cr,
                borderSide: BorderSide(color: MainColors.outline),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: 12.cr,
                borderSide: BorderSide(color: MainColors.outline),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: 12.cr,
                borderSide: BorderSide(color: MainColors.primary, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: 12.cr,
                borderSide: const BorderSide(color: MainColors.error),
              ),
              filled: true,
              fillColor: MainColors.inputFill,
              prefixIcon: Icon(
                Icons.calendar_today,
                color: MainColors.primary,
              ),
            ),
            onChanged: _validateAndParseInput,
            keyboardType: TextInputType.datetime,
          ),
          const SizedBox(height: 16),
          if (_errorText != null)
            Text(
              _errorText!,
              style: const TextStyle(
                color: MainColors.error,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCalendarMode() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: MainColors.primary,
            onPrimary: MainColors.onPrimary,
            surface: MainColors.surface2,
            onSurface: MainColors.onSurface,
            secondary: MainColors.accent,
            onSecondary: MainColors.onPrimary,
          ),
          datePickerTheme: DatePickerThemeData(
            backgroundColor: MainColors.surface2,
            headerBackgroundColor: MainColors.primary,
            headerForegroundColor: MainColors.onPrimary,
            dayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return MainColors.onPrimary;
              }
              if (states.contains(WidgetState.disabled)) {
                return MainColors.muted.withValues(alpha: 0.4);
              }
              return MainColors.onSurface;
            }),
            dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return MainColors.primary;
              }
              return Colors.transparent;
            }),
            todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return MainColors.primary;
              }
              return MainColors.accent.withValues(alpha: 0.2);
            }),
            todayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return MainColors.onPrimary;
              }
              return MainColors.primary;
            }),
            dayOverlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.pressed)) {
                return MainColors.primary.withValues(alpha: 0.1);
              }
              if (states.contains(WidgetState.hovered)) {
                return MainColors.accent.withValues(alpha: 0.1);
              }
              return null;
            }),
            yearForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return MainColors.onPrimary;
              }
              return MainColors.onSurface;
            }),
            yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return MainColors.primary;
              }
              return Colors.transparent;
            }),
            shape: RoundedRectangleBorder(
              borderRadius: 12.cr,
            ),
            dayShape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            yearShape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        child: currentMode == DatePickerMode.year
            ? YearPicker(
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          selectedDate: selectedDate,
          onChanged: (DateTime date) {
            setState(() {
              selectedDate = DateTime(date.year, selectedDate.month, selectedDate.day);
              currentMode = DatePickerMode.day;
            });
          },
        )
            : CalendarDatePicker(
          initialDate: selectedDate,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          onDateChanged: (DateTime date) {
            if (widget.selectableDayPredicate == null ||
                widget.selectableDayPredicate!(date)) {
              setState(() {
                selectedDate = date;
              });
            }
          },
          selectableDayPredicate: widget.selectableDayPredicate,
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                selectedDate = DateTime.now();
                _textController.text = _formatDateForInput(selectedDate);
                _errorText = null;
              });
            },
            icon: Icon(Icons.today, color: MainColors.accent),
            label: Text(
              'اليوم',
              style: TextStyle(color: MainColors.accent),
            ),
          ),
          Row(
            children: [
              _buildActionButton(
                text: widget.cancelText,
                onPressed: () => Navigator.of(context).pop(),
                isPrimary: false,
                tooltip: widget.cancelTooltip,
              ),
              const SizedBox(width: 12),
              _buildActionButton(
                text: widget.confirmText,
                onPressed: _canConfirm()
                    ? () => Navigator.of(context).pop(selectedDate)
                    : null,
                isPrimary: true,
                tooltip: widget.confirmTooltip,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required VoidCallback? onPressed,
    required bool isPrimary,
    String? tooltip,
  }) {
    final button = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: 12.cr,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: isPrimary
                  ? (onPressed != null ? MainColors.primary : MainColors.muted)
                  : Colors.transparent,
              borderRadius: 12.cr,
              border: isPrimary
                  ? null
                  : Border.all(color: MainColors.outline, width: 1.5),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isPrimary
                    ? MainColors.onPrimary
                    : MainColors.onSurface,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );

    return tooltip != null ? Tooltip(message: tooltip, child: button) : button;
  }

  bool _canConfirm() {
    if (entryMode == DatePickerEntryMode.input) {
      return _errorText == null && _textController.text.isNotEmpty;
    }
    return true;
  }

  void _validateAndParseInput(String input) {
    setState(() {
      _errorText = null;
    });

    if (input.isEmpty) return;

    try {
      // Support multiple date formats
      DateTime? parsedDate;

      // Try dd/mm/yyyy format
      if (RegExp(r'^\d{1,2}/\d{1,2}/\d{4}$').hasMatch(input)) {
        final parts = input.split('/');
        parsedDate = DateTime(
          int.parse(parts[2]),
          int.parse(parts[1]),
          int.parse(parts[0]),
        );
      }
      // Try yyyy-mm-dd format
      else if (RegExp(r'^\d{4}-\d{1,2}-\d{1,2}$').hasMatch(input)) {
        parsedDate = DateTime.parse(input);
      }

      if (parsedDate != null) {
        if (parsedDate.isBefore(widget.firstDate) ||
            parsedDate.isAfter(widget.lastDate)) {
          setState(() {
            _errorText = widget.errorInvalidText ?? 'التاريخ خارج النطاق المسموح';
          });
          return;
        }

        if (widget.selectableDayPredicate != null &&
            !widget.selectableDayPredicate!(parsedDate)) {
          setState(() {
            _errorText = 'التاريخ المدخل غير متاح للاختيار';
          });
          return;
        }

        setState(() {
          selectedDate = parsedDate!;
        });
      } else {
        setState(() {
          _errorText = widget.errorFormatText ?? 'تنسيق التاريخ غير صحيح';
        });
      }
    } catch (e) {
      setState(() {
        _errorText = widget.errorFormatText ?? 'تنسيق التاريخ غير صحيح';
      });
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatDateForInput(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _getMonthName(int month) {
    const months = [
      'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];
    return months[month - 1];
  }
}

// Extension to make it easier to use
extension CustomCalendarExtension on BuildContext {
  Future<DateTime?> showCustomCalendar({
    DateTime? initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    String? title,
    String? confirmText,
    String? cancelText,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    SelectableDayPredicate? selectableDayPredicate,
    String? helpText,
    String? cancelTooltip,
    String? confirmTooltip,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
  }) {
    return CustomCalendar.show(
      context: this,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      title: title,
      confirmText: confirmText,
      cancelText: cancelText,
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicate,
      helpText: helpText,
      cancelTooltip: cancelTooltip,
      confirmTooltip: confirmTooltip,
      initialDatePickerMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
    );
  }
}