import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;
import '../../../design_system/tokens/oka_tokens.dart';

@wb.UseCase(name: 'Primitivos — Blue', type: _ColorPalette, path: '[Tokens]/Cores')
Widget colorBlue(BuildContext context) => const _ColorPalette(group: 'Blue');

@wb.UseCase(name: 'Primitivos — Grey', type: _ColorPalette, path: '[Tokens]/Cores')
Widget colorGrey(BuildContext context) => const _ColorPalette(group: 'Grey');

@wb.UseCase(name: 'Primitivos — Yellow', type: _ColorPalette, path: '[Tokens]/Cores')
Widget colorYellow(BuildContext context) => const _ColorPalette(group: 'Yellow');

@wb.UseCase(name: 'Primitivos — Green', type: _ColorPalette, path: '[Tokens]/Cores')
Widget colorGreen(BuildContext context) => const _ColorPalette(group: 'Green');

@wb.UseCase(name: 'Primitivos — Red', type: _ColorPalette, path: '[Tokens]/Cores')
Widget colorRed(BuildContext context) => const _ColorPalette(group: 'Red');

@wb.UseCase(name: 'Semânticos — Brand', type: _ColorPalette, path: '[Tokens]/Cores')
Widget colorBrand(BuildContext context) => const _ColorPalette(group: 'Brand');

@wb.UseCase(name: 'Semânticos — Text', type: _ColorPalette, path: '[Tokens]/Cores')
Widget colorText(BuildContext context) => const _ColorPalette(group: 'Text');

@wb.UseCase(name: 'Semânticos — Feedback', type: _ColorPalette, path: '[Tokens]/Cores')
Widget colorFeedback(BuildContext context) => const _ColorPalette(group: 'Feedback');

// ── Helper widget ──────────────────────────────────────────────────────────────

class _ColorPalette extends StatelessWidget {
  const _ColorPalette({required this.group});
  final String group;

  static const _palettes = {
    'Blue': [
      ('Blue/100', OkaPrimitiveColors.blue100),
      ('Blue/200', OkaPrimitiveColors.blue200),
      ('Blue/300', OkaPrimitiveColors.blue300),
      ('Blue/400', OkaPrimitiveColors.blue400),
      ('Blue/500', OkaPrimitiveColors.blue500),
      ('Blue/600', OkaPrimitiveColors.blue600),
    ],
    'Grey': [
      ('Grey/100', OkaPrimitiveColors.grey100),
      ('Grey/200', OkaPrimitiveColors.grey200),
      ('Grey/300', OkaPrimitiveColors.grey300),
      ('Grey/400', OkaPrimitiveColors.grey400),
      ('Grey/500', OkaPrimitiveColors.grey500),
      ('Grey/600', OkaPrimitiveColors.grey600),
    ],
    'Yellow': [
      ('Yellow/100', OkaPrimitiveColors.yellow100),
      ('Yellow/200', OkaPrimitiveColors.yellow200),
      ('Yellow/300', OkaPrimitiveColors.yellow300),
      ('Yellow/400', OkaPrimitiveColors.yellow400),
      ('Yellow/500', OkaPrimitiveColors.yellow500),
      ('Yellow/600', OkaPrimitiveColors.yellow600),
    ],
    'Green': [
      ('Green/100', OkaPrimitiveColors.green100),
      ('Green/200', OkaPrimitiveColors.green200),
      ('Green/300', OkaPrimitiveColors.green300),
      ('Green/400', OkaPrimitiveColors.green400),
      ('Green/500', OkaPrimitiveColors.green500),
      ('Green/600', OkaPrimitiveColors.green600),
    ],
    'Red': [
      ('Red/100', OkaPrimitiveColors.red100),
      ('Red/200', OkaPrimitiveColors.red200),
      ('Red/300', OkaPrimitiveColors.red300),
      ('Red/400', OkaPrimitiveColors.red400),
      ('Red/500', OkaPrimitiveColors.red500),
      ('Red/600', OkaPrimitiveColors.red600),
    ],
    'Brand': [
      ('Brand/Primary',   OkaColors.brandPrimary),
      ('Brand/Secondary', OkaColors.brandSecondary),
      ('Brand/Light',     OkaColors.brandLight),
      ('Brand/Dark',      OkaColors.brandDark),
    ],
    'Text': [
      ('Text/Default',   OkaColors.textDefault),
      ('Text/Neutral',   OkaColors.textNeutral),
      ('Text/Primary',   OkaColors.textPrimary),
      ('Text/Secondary', OkaColors.textSecondary),
      ('Text/Light',     OkaColors.textLight),
      ('Text/Disabled',  OkaColors.textDisabled),
      ('Text/Error',     OkaColors.textError),
      ('Text/Warning',   OkaColors.textWarning),
      ('Text/Success',   OkaColors.textSuccess),
    ],
    'Feedback': [
      ('Feedback/BG Error',   OkaColors.feedbackBgError),
      ('Feedback/BG Warning', OkaColors.feedbackBgWarning),
      ('Feedback/BG Success', OkaColors.feedbackBgSuccess),
      ('Feedback/BG New',     OkaColors.feedbackBgNew),
      ('Feedback/BG Info',    OkaColors.feedbackBgInfo),
      ('Feedback/BG Dark',    OkaColors.feedbackBgDark),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final items = _palettes[group] ?? [];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: items.map((e) => _Swatch(name: e.$1, color: e.$2)).toList(),
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({required this.name, required this.color});
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final hex = '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
            ),
          ),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
          Text(hex,  style: const TextStyle(fontSize: 11, color: Colors.black54)),
        ],
      ),
    );
  }
}
