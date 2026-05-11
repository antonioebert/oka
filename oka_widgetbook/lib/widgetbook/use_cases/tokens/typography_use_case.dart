import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;
import '../../../design_system/tokens/oka_tokens.dart';

@wb.UseCase(name: 'Escala Tipográfica', type: _TypographyScale, path: '[Tokens]/Tipografia')
Widget typographyScale(BuildContext context) => const _TypographyScale();

class _TypographyScale extends StatelessWidget {
  const _TypographyScale();

  @override
  Widget build(BuildContext context) {
    final styles = [
      ('Heading Large 700',   OkaTypography.headingLarge700),
      ('Heading Large 600',   OkaTypography.headingLarge600),
      ('Heading Large 500',   OkaTypography.headingLarge500),
      ('Heading Medium 700',  OkaTypography.headingMedium700),
      ('Heading Medium 600',  OkaTypography.headingMedium600),
      ('Heading Medium 500',  OkaTypography.headingMedium500),
      ('Heading Small 700',   OkaTypography.headingSmall700),
      ('Subtitle 700',        OkaTypography.subtitle700),
      ('Subtitle 600',        OkaTypography.subtitle600),
      ('Subtitle 500',        OkaTypography.subtitle500),
      ('Body 700',            OkaTypography.body700),
      ('Body 600',            OkaTypography.body600),
      ('Body 500',            OkaTypography.body500),
      ('Description M 700',   OkaTypography.descMedium700),
      ('Description M 600',   OkaTypography.descMedium600),
      ('Description M 500',   OkaTypography.descMedium500),
      ('Label L (Botão)',     OkaTypography.labelL),
      ('Label M (Botão)',     OkaTypography.labelM),
    ];

    return ListView(
      padding: const EdgeInsets.all(24),
      children: styles.map((e) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            SizedBox(
              width: 180,
              child: Text(e.$1, style: const TextStyle(fontSize: 11, color: Colors.black45)),
            ),
            Expanded(
              child: Text('Aa Bb Cc — 0123', style: e.$2.copyWith(color: OkaColors.textDefault)),
            ),
          ],
        ),
      )).toList(),
    );
  }
}
