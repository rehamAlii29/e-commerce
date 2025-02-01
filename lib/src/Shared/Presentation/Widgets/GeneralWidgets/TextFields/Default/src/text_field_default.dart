part of 'imports_text_field.dart';

class TextFieldDefault extends StatefulWidget {
  //<editor-fold desc="Imps">
  final PrefixImp prefix;
  final SuffixImp suffix;
  final InputDecorationImp inputDecoration;
  final TFFTextImp hint;
  final TFFTextImp label;
  final TFFTextImp error;
  final TFFTextImp input;
  final TFFTextImp header;
  final bool requiredfilled;

  //</editor-fold>
  //<editor-fold desc="Input Style">
  final int maxLines;
  final TextEditingController? controller;
  final SecureType secureType;

  //</editor-fold>
  //<editor-fold desc="Actions">
  /// AppValidator
  final String? Function(String?)? validation;
  final Function(String)? onChanged;
  final VoidCallback? onComplete;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onTap;

  //</editor-fold>
  //<editor-fold desc="Padding">
  final double horizontalPadding;
  final double verticalPadding;
  final EdgeInsets surroundingPadding;

  //</editor-fold>
  //<editor-fold desc="Types">
  final bool enable;
  final bool isRequired;
  final FocusNode? node;
  final bool readOnly;

  //</editor-fold>
  final IconData? icon;
  final Color? cursorColor;
  final Color? fillColor;
  final Color? iconColor;
  final bool isRounded;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;

  const TextFieldDefault({
    Key? key,
    this.prefix = const PrefixNone(),
    this.suffix = const SuffixNone(),
    this.inputDecoration = const InputDecorationWithBorder(),
    this.hint = const TFFHint(),
    this.label = const TFFNone(),
    this.error = const TFFError(),
    this.input = const TFFInput(),
    this.header = const TFFNone(),
    this.controller,
    this.fillColor,
    this.isRounded = false,
    this.validation,
    this.onChanged,
    this.onTap,
    this.onComplete,
    this.onSaved,
    this.maxLines = 1,
    this.enable = true,
    this.cursorColor,
    this.horizontalPadding = 19.0,
    this.verticalPadding = 14.0,
    this.icon,
    this.iconColor,
    this.keyboardType,
    this.textInputAction,
    this.secureType = SecureType.Never,
    this.isRequired = false,
    this.readOnly = false,
    this.surroundingPadding = EdgeInsets.zero,
    this.node,
    this.autovalidateMode,
    this.requiredfilled = false,
  }) : super(key: key);

  @override
  _TextFieldDefaultState createState() => _TextFieldDefaultState();
}

class _TextFieldDefaultState extends State<TextFieldDefault> {
  bool secureState = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: widget.surroundingPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TFFHeaderBuilder(
                header: widget.header,
                required: widget.isRequired,
              ),
              TextFormField(
                enableInteractiveSelection: true,
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: true,
                  selectAll: true,
                ),
                focusNode: widget.node,
                autocorrect: true,
                readOnly: widget.readOnly,
                onTap: widget.onTap,
                obscureText: widget.suffix is SuffixPassword
                    ? (widget.suffix as SuffixPassword).isPasswordVisible
                    : TFFStyles.getObscureText(
                        widget.secureType,
                        secureState: secureState,
                      ),
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                onEditingComplete: widget.onComplete,
                onChanged: widget.onChanged,
                onSaved: widget.onSaved,
                controller: widget.controller,
                cursorColor: widget.cursorColor ?? AppColors.get.tTFCursor,
                enabled: widget.enable,
                maxLines: widget.maxLines,
                validator:
                    widget.validation ?? AppValidator.noneValidator.validate,
                autovalidateMode: widget.autovalidateMode,
                style: widget.input.getTextStyle,
                decoration: InputDecoration(
                  // filled: false,
                  filled: widget.fillColor != null,
                  icon: widget.icon != null
                      ? Icon(
                          widget.icon,
                          color: widget.iconColor,
                          size: 24.toW(),
                        )
                      : null,
                  errorMaxLines: 2,
                  focusedErrorBorder: TffBorders.getBorder(
                    inputDecoration: widget.inputDecoration,
                    type: BorderType.error,
                  ),
                  fillColor: widget.fillColor ?? Colors.green,
                  // HINT TEXT WITH STYLE
                  // hintText: widget.hint,
                  hintText: widget.hint.title,
                  hintStyle: widget.hint.getTextStyle,
                  // LABEL TEXT WITH STYLE
                  labelText: widget.label.title,
                  labelStyle: widget.label.getTextStyle,
                  // ERROR TEXT STYLE
                  errorStyle: widget.error.getTextStyle,

                  // PADDING
                  contentPadding: EdgeInsets.symmetric(
                    vertical: widget.verticalPadding.toH(),
                    horizontal: widget.horizontalPadding.toW(),
                  ),
                  //<editor-fold desc="prefix">
                  prefixIcon: widget.prefix.render(context),
                  prefixText: widget.prefix is PrefixWithText
                      ? widget.prefix.title ?? ""
                      : null,
                  prefixStyle: widget.prefix is PrefixWithText
                      ? TextStyle(
                          color: widget.prefix.color,
                          fontSize: widget.prefix.fontSize,
                          fontWeight: widget.prefix.fontWeight,
                        )
                      : null,
                  prefixIconConstraints: widget.prefix.getBoxConstraints,
                  //</editor-fold>
                  //<editor-fold desc="Suffix">
                  suffixIcon: widget.suffix.render(context),
                  suffixText: widget.suffix is SuffixWithText
                      ? widget.suffix.title ?? ""
                      : null,
                  suffixStyle: widget.suffix is SuffixWithText
                      ? TextStyle(
                          color: widget.suffix.color,
                          fontSize: widget.suffix.fontSize,
                          fontWeight: widget.suffix.fontWeight,
                        )
                      : null,
                  suffixIconConstraints: widget.suffix.getBoxConstraints,
                  //</editor-fold>
                  //<editor-fold desc="Borders">
                  border: TffBorders.getBorder(
                    inputDecoration: widget.inputDecoration,
                    type: BorderType.border,
                  ),
                  disabledBorder: TffBorders.getBorder(
                    inputDecoration: widget.inputDecoration,
                    type: BorderType.disabled,
                  ),
                  enabledBorder: TffBorders.getBorder(
                    inputDecoration: widget.inputDecoration,
                    type: BorderType.enable,
                  ),
                  focusedBorder: TffBorders.getBorder(
                    inputDecoration: widget.inputDecoration,
                    type: BorderType.focus,
                  ),
                  errorBorder: TffBorders.getBorder(
                    inputDecoration: widget.inputDecoration,
                    type: BorderType.error,
                  ),
                  //</editor-fold>
                ),
              ),
            ],
          ),
        ),
        // if (widget.isRequired) const TFFRequiredBuilder(),
      ],
    );
  }
}
