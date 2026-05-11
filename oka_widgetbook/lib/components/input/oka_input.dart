import 'package:flutter/material.dart';
import '../../design_system/tokens/oka_tokens.dart';

enum OkaInputVariation { texto, telefone }

enum OkaInputState { habilitado, visualizacao, desabilitado, erro }

class OkaInput extends StatefulWidget {
  const OkaInput({
    super.key,
    this.label = 'Label',
    this.hint = 'Placeholder',
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.variation = OkaInputVariation.texto,
    this.inputState = OkaInputState.habilitado,
    this.controller,
  });

  final String label;
  final String hint;
  final String? helperText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final OkaInputVariation variation;
  final OkaInputState inputState;
  final TextEditingController? controller;

  @override
  State<OkaInput> createState() => _OkaInputState();
}

class _OkaInputState extends State<OkaInput> {
  bool _focused = false;

  Color get _borderColor {
    switch (widget.inputState) {
      case OkaInputState.erro:        return OkaColors.stateError;
      case OkaInputState.desabilitado:return OkaColors.strokeNeutral;
      case OkaInputState.visualizacao:return OkaColors.strokeDefault;
      case OkaInputState.habilitado:  return _focused ? OkaColors.strokePrimary : OkaColors.strokeDefault;
    }
  }

  Color get _labelColor {
    switch (widget.inputState) {
      case OkaInputState.erro:        return OkaColors.textError;
      case OkaInputState.desabilitado:return OkaColors.textDisabled;
      default:                        return _focused ? OkaColors.brandPrimary : OkaColors.textDefault;
    }
  }

  bool get _isEnabled => widget.inputState == OkaInputState.habilitado;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(widget.label, style: OkaTypography.body600.copyWith(color: _labelColor)),
        const SizedBox(height: 4),
        // Field
        Focus(
          onFocusChange: (v) => setState(() => _focused = v),
          child: TextFormField(
            controller: widget.controller,
            enabled: _isEnabled,
            readOnly: widget.inputState == OkaInputState.visualizacao,
            keyboardType: widget.variation == OkaInputVariation.telefone
                ? TextInputType.phone
                : TextInputType.text,
            style: OkaTypography.body500.copyWith(color: OkaColors.textDefault),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: OkaTypography.body500.copyWith(color: OkaColors.textDisabled),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: OkaColors.iconDefault, size: 20)
                  : (widget.variation == OkaInputVariation.telefone
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text('+55', style: OkaTypography.body500.copyWith(color: OkaColors.textDefault)),
                        )
                      : null),
              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: widget.inputState == OkaInputState.erro
                  ? Icon(Icons.error_outline, color: OkaColors.iconError, size: 20)
                  : (widget.suffixIcon != null
                      ? Icon(widget.suffixIcon, color: OkaColors.iconDefault, size: 20)
                      : null),
              helperText: widget.inputState == OkaInputState.erro
                  ? widget.errorText ?? 'Mensagem de erro'
                  : widget.helperText,
              helperStyle: OkaTypography.descMedium500.copyWith(
                color: widget.inputState == OkaInputState.erro
                    ? OkaColors.textError
                    : OkaColors.textNeutral,
              ),
              filled: widget.inputState == OkaInputState.desabilitado,
              fillColor: OkaColors.bgDefault,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(OkaBorderRadius.small),
                borderSide: BorderSide(color: _borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(OkaBorderRadius.small),
                borderSide: BorderSide(color: OkaColors.strokePrimary, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(OkaBorderRadius.small),
                borderSide: BorderSide(color: OkaColors.stateError),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(OkaBorderRadius.small),
                borderSide: BorderSide(color: OkaColors.stateError, width: 1.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(OkaBorderRadius.small),
                borderSide: BorderSide(color: OkaColors.strokeNeutral),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
