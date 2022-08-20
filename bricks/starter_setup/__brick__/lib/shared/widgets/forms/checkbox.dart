import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class {{name.pascalCase()}}Checkbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color? checkedFillColor;
  final IconData checkedIcon;
  final Color uncheckedIconColor;
  final Color uncheckedFillColor;
  final IconData uncheckedIcon;
  final double? borderWidth;
  final double? checkBoxSize;
  final bool shouldShowBorder;
  final Color? borderColor;
  final double? borderRadius;
  final double? splashRadius;
  final Color? splashColor;
  final String? tooltip;
  final MouseCursor? mouseCursors;
  final String? text;
  final double? fontSize;

  const {{name.pascalCase()}}Checkbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor = Colors.white,
    this.uncheckedFillColor = Colors.white,
    this.uncheckedIcon = Icons.close,
    this.borderWidth,
    this.checkBoxSize,
    this.shouldShowBorder = false,
    this.borderColor,
    this.borderRadius,
    this.splashRadius,
    this.splashColor,
    this.tooltip,
    this.mouseCursors,
    this.fontSize,
    this.text,
  }) : super(key: key);

  @override
  _{{name.pascalCase()}}CheckboxState createState() => _{{name.pascalCase()}}CheckboxState();
}

class _{{name.pascalCase()}}CheckboxState extends State<{{name.pascalCase()}}Checkbox> {
  late bool _checked;
  late CheckStatus _status;
  late Color _filledColor;

  @override
  void initState() {
    _filledColor = widget.checkedFillColor ?? AppColors.zeptaPurple;
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(${{name}}Checkbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color fillColor;
    late Color iconColor;
    late IconData iconData;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = _filledColor;
        iconColor = widget.checkedIconColor;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor;
        iconColor = widget.uncheckedIconColor;
        iconData = widget.uncheckedIcon;
        break;
    }

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius:
            BorderRadius.all(Radius.circular(widget.borderRadius ?? 6)),
        border: Border.all(
          color: widget.shouldShowBorder
              ? (widget.borderColor ?? AppColors.zeptaGrayscale[40]!)
              : (!widget.value
                  ? (widget.borderColor ?? AppColors.zeptaGrayscale[50]!)
                  : Colors.transparent),
          width: widget.shouldShowBorder ? widget.borderWidth ?? 2.0 : 2.0,
        ),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: widget.checkBoxSize ?? 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!_checked);
      },
      child: Row(
        children: [
          IconButton(
            icon: _buildIcon(),
            onPressed: () => widget.onChanged(!_checked),
            splashRadius: widget.splashRadius,
            splashColor: widget.splashColor,
            tooltip: widget.tooltip,
            mouseCursor: widget.mouseCursors ?? SystemMouseCursors.click,
          ),
          Text(
            widget.text ?? "",
            style: TextStyle(
              fontSize: widget.fontSize ?? 14.sp,
              color: AppColors.zeptaGrayscale[50],
            ),
          )
        ],
      ),
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
