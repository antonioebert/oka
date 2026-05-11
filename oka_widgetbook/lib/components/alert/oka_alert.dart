import 'package:flutter/material.dart';
import '../../design_system/tokens/oka_tokens.dart';

enum OkaAlertStatus { alerta, neutroNegativo, positivo }

enum OkaAlertVariation { simples, comTitulo, comBotaoAoLado, botaoEmbaixo }

class OkaAlert extends StatelessWidget {
  const OkaAlert({
    super.key,
    this.status = OkaAlertStatus.neutroNegativo,
    this.variation = OkaAlertVariation.simples,
    this.title,
    this.message = 'Mensagem informativa para o usuário sobre algo importante.',
    this.actionLabel = 'Ação',
    this.onAction,
  });

  final OkaAlertStatus status;
  final OkaAlertVariation variation;
  final String? title;
  final String message;
  final String actionLabel;
  final VoidCallback? onAction;

  Color get _bgColor {
    switch (status) {
      case OkaAlertStatus.alerta:        return OkaColors.feedbackBgWarning;
      case OkaAlertStatus.neutroNegativo:return OkaColors.feedbackBgInfo;
      case OkaAlertStatus.positivo:      return OkaColors.feedbackBgSuccess;
    }
  }

  Color get _iconColor {
    switch (status) {
      case OkaAlertStatus.alerta:        return OkaColors.iconWarning;
      case OkaAlertStatus.neutroNegativo:return OkaColors.iconDefault;
      case OkaAlertStatus.positivo:      return OkaColors.iconSuccess;
    }
  }

  Color get _textColor {
    switch (status) {
      case OkaAlertStatus.alerta:        return OkaColors.textWarning;
      case OkaAlertStatus.neutroNegativo:return OkaColors.textDefault;
      case OkaAlertStatus.positivo:      return OkaColors.textSuccess;
    }
  }

  IconData get _icon {
    switch (status) {
      case OkaAlertStatus.alerta:        return Icons.warning_amber_rounded;
      case OkaAlertStatus.neutroNegativo:return Icons.info_outline;
      case OkaAlertStatus.positivo:      return Icons.check_circle_outline;
    }
  }

  Widget _buildAction(Color textColor) => TextButton(
        onPressed: onAction,
        style: TextButton.styleFrom(foregroundColor: textColor, padding: EdgeInsets.zero),
        child: Text(actionLabel, style: OkaTypography.body700.copyWith(color: textColor)),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(OkaBorderRadius.small),
      ),
      child: switch (variation) {
        OkaAlertVariation.simples => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(_icon, color: _iconColor, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(message, style: OkaTypography.body500.copyWith(color: _textColor))),
            ],
          ),
        OkaAlertVariation.comTitulo => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(_icon, color: _iconColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title ?? 'Título', style: OkaTypography.body700.copyWith(color: _textColor)),
                    const SizedBox(height: 4),
                    Text(message, style: OkaTypography.body500.copyWith(color: _textColor)),
                  ],
                ),
              ),
            ],
          ),
        OkaAlertVariation.comBotaoAoLado => Row(
            children: [
              Icon(_icon, color: _iconColor, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(message, style: OkaTypography.body500.copyWith(color: _textColor))),
              const SizedBox(width: 8),
              _buildAction(_textColor),
            ],
          ),
        OkaAlertVariation.botaoEmbaixo => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(_icon, color: _iconColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(child: Text(message, style: OkaTypography.body500.copyWith(color: _textColor))),
                ],
              ),
              const SizedBox(height: 12),
              _buildAction(_textColor),
            ],
          ),
      },
    );
  }
}
