import 'package:flutter/material.dart';
import '../../design_system/tokens/oka_tokens.dart';

// ─── Enums ────────────────────────────────────────────────────────────────────

enum OkaButtonType { primario, secundario, terciario, link }

enum OkaButtonSize { grande, medio, pequeno, link }

enum OkaButtonIconSide { none, esquerda, direita }

// ─── Widget ───────────────────────────────────────────────────────────────────

class OkaButton extends StatelessWidget {
  const OkaButton({
    super.key,
    required this.label,
    this.onPressed,
    this.tipo = OkaButtonType.primario,
    this.tamanho = OkaButtonSize.grande,
    this.iconSide = OkaButtonIconSide.none,
    this.icon,
    this.isDisabled = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final OkaButtonType tipo;
  final OkaButtonSize tamanho;
  final OkaButtonIconSide iconSide;
  final IconData? icon;
  final bool isDisabled;

  // ── Resolvers ──────────────────────────────────────────────────────────────

  Color get _bgColor {
    if (isDisabled) return OkaColors.btnDisabled;
    switch (tipo) {
      case OkaButtonType.primario:   return OkaColors.btnActive;
      case OkaButtonType.secundario: return Colors.transparent;
      case OkaButtonType.terciario:  return Colors.transparent;
      case OkaButtonType.link:       return Colors.transparent;
    }
  }

  Color get _fgColor {
    if (isDisabled) return OkaColors.textDisabled;
    switch (tipo) {
      case OkaButtonType.primario:   return OkaColors.labelPrimary;
      case OkaButtonType.secundario: return OkaColors.brandPrimary;
      case OkaButtonType.terciario:  return OkaColors.textPrimary;
      case OkaButtonType.link:       return OkaColors.labelLink;
    }
  }

  BorderSide get _border {
    if (isDisabled) return BorderSide(color: OkaColors.strokeNeutral);
    switch (tipo) {
      case OkaButtonType.secundario: return BorderSide(color: OkaColors.strokePrimary, width: 1.5);
      default:                       return BorderSide.none;
    }
  }

  EdgeInsetsGeometry get _padding {
    switch (tamanho) {
      case OkaButtonSize.grande:  return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
      case OkaButtonSize.medio:   return const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
      case OkaButtonSize.pequeno: return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case OkaButtonSize.link:    return const EdgeInsets.symmetric(horizontal: 4, vertical: 0);
    }
  }

  TextStyle get _textStyle {
    switch (tamanho) {
      case OkaButtonSize.grande: return OkaTypography.labelL.copyWith(color: _fgColor);
      default:                   return OkaTypography.labelM.copyWith(color: _fgColor);
    }
  }

  double get _borderRadius {
    switch (tamanho) {
      case OkaButtonSize.link: return 0;
      default:                 return OkaBorderRadius.small;
    }
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  Widget _buildIcon(double size) => Icon(icon ?? Icons.star, size: size, color: _fgColor);

  @override
  Widget build(BuildContext context) {
    final iconSize = tamanho == OkaButtonSize.grande ? 20.0 : 16.0;
    final hasIcon  = icon != null && iconSide != OkaButtonIconSide.none;

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasIcon && iconSide == OkaButtonIconSide.esquerda) ...[
          _buildIcon(iconSize),
          const SizedBox(width: 8),
        ],
        Text(label, style: _textStyle),
        if (hasIcon && iconSide == OkaButtonIconSide.direita) ...[
          const SizedBox(width: 8),
          _buildIcon(iconSize),
        ],
      ],
    );

    if (tipo == OkaButtonType.link) {
      return GestureDetector(
        onTap: isDisabled ? null : onPressed,
        child: content,
      );
    }

    return OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: _bgColor,
        foregroundColor: _fgColor,
        padding: _padding,
        side: _border,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        disabledBackgroundColor: OkaColors.btnDisabled,
        disabledForegroundColor: OkaColors.textDisabled,
      ),
      child: content,
    );
  }
}
