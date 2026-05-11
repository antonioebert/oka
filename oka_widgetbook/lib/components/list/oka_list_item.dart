import 'package:flutter/material.dart';
import '../../design_system/tokens/oka_tokens.dart';
import '../tag/oka_tag.dart';

enum OkaListVariation {
  defaultItem,
  defaultBotao,
  defaultTagLateral,
  defaultTagTitulo,
  defaultInfoTitulo,
  iconeBackground,
  iconeBackgroundBotao,
  iconeBackgroundTagLateral,
}

class OkaListItem extends StatelessWidget {
  const OkaListItem({
    super.key,
    this.variation = OkaListVariation.defaultItem,
    this.title = 'Título do item',
    this.subtitle = 'Descrição complementar do item da lista',
    this.icon = Icons.star_outline,
    this.actionLabel = 'Ação',
    this.tagStatus = OkaTagStatus.ativo,
    this.infoLabel = 'Info',
    this.onTap,
    this.onAction,
  });

  final OkaListVariation variation;
  final String title;
  final String subtitle;
  final IconData icon;
  final String actionLabel;
  final OkaTagStatus tagStatus;
  final String infoLabel;
  final VoidCallback? onTap;
  final VoidCallback? onAction;

  Widget _iconBg() => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: OkaColors.bgPrimary,
          borderRadius: BorderRadius.circular(OkaBorderRadius.small),
        ),
        child: Icon(icon, color: OkaColors.iconPrimary, size: 20),
      );

  Widget _chevron() => Icon(Icons.chevron_right, color: OkaColors.iconDefault, size: 20);

  Widget _actionBtn() => TextButton(
        onPressed: onAction,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(actionLabel, style: OkaTypography.body700.copyWith(color: OkaColors.brandPrimary)),
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Leading
            if ([
              OkaListVariation.iconeBackground,
              OkaListVariation.iconeBackgroundBotao,
              OkaListVariation.iconeBackgroundTagLateral,
            ].contains(variation)) ...[
              _iconBg(),
              const SizedBox(width: 12),
            ],

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title row
                  Row(
                    children: [
                      Expanded(
                        child: Text(title, style: OkaTypography.body600.copyWith(color: OkaColors.textDefault)),
                      ),
                      if (variation == OkaListVariation.defaultTagTitulo) ...[
                        const SizedBox(width: 8),
                        OkaTag(status: tagStatus),
                      ],
                      if (variation == OkaListVariation.defaultInfoTitulo) ...[
                        const SizedBox(width: 8),
                        Text(infoLabel, style: OkaTypography.descMedium500.copyWith(color: OkaColors.textNeutral)),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(subtitle, style: OkaTypography.descMedium500.copyWith(color: OkaColors.textNeutral)),
                ],
              ),
            ),

            // Trailing
            const SizedBox(width: 8),
            if (variation == OkaListVariation.defaultTagLateral ||
                variation == OkaListVariation.iconeBackgroundTagLateral)
              OkaTag(status: tagStatus)
            else if (variation == OkaListVariation.defaultBotao ||
                variation == OkaListVariation.iconeBackgroundBotao)
              _actionBtn()
            else
              _chevron(),
          ],
        ),
      ),
    );
  }
}
