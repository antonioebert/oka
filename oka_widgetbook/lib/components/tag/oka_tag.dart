import 'package:flutter/material.dart';
import '../../design_system/tokens/oka_tokens.dart';

enum OkaTagStatus { novidade, ativo, desativado, cancelado, pendente, neutro }

class OkaTag extends StatelessWidget {
  const OkaTag({super.key, this.status = OkaTagStatus.ativo});

  final OkaTagStatus status;

  String get _label {
    switch (status) {
      case OkaTagStatus.novidade:   return 'Novidade';
      case OkaTagStatus.ativo:      return 'Ativo';
      case OkaTagStatus.desativado: return 'Desativado';
      case OkaTagStatus.cancelado:  return 'Cancelado';
      case OkaTagStatus.pendente:   return 'Pendente';
      case OkaTagStatus.neutro:     return 'Neutro';
    }
  }

  Color get _bgColor {
    switch (status) {
      case OkaTagStatus.novidade:   return OkaColors.feedbackBgNew;
      case OkaTagStatus.ativo:      return OkaColors.feedbackBgSuccess;
      case OkaTagStatus.desativado: return OkaColors.feedbackBgInfo;
      case OkaTagStatus.cancelado:  return OkaColors.feedbackBgError;
      case OkaTagStatus.pendente:   return OkaColors.feedbackBgWarning;
      case OkaTagStatus.neutro:     return OkaColors.bgDefault;
    }
  }

  Color get _fgColor {
    switch (status) {
      case OkaTagStatus.novidade:   return OkaColors.labelPrimary;
      case OkaTagStatus.ativo:      return OkaColors.textSuccess;
      case OkaTagStatus.desativado: return OkaColors.textDefault;
      case OkaTagStatus.cancelado:  return OkaColors.textError;
      case OkaTagStatus.pendente:   return OkaColors.textWarning;
      case OkaTagStatus.neutro:     return OkaColors.textDefault;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(OkaBorderRadius.large),
      ),
      child: Text(_label, style: OkaTypography.descMedium600.copyWith(color: _fgColor)),
    );
  }
}
