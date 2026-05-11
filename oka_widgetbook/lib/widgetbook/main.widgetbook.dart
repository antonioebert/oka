import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;

// Tokens
import '../design_system/tokens/oka_tokens.dart';
import 'use_cases/tokens/colors_use_case.dart';
import 'use_cases/tokens/typography_use_case.dart';
import 'use_cases/tokens/spacing_use_case.dart';

// Components
import '../components/button/oka_button.dart';
import '../components/input/oka_input.dart';
import '../components/alert/oka_alert.dart';
import '../components/tag/oka_tag.dart';
import '../components/pill/oka_pill.dart';
import '../components/list/oka_list_item.dart';

// Use cases
import 'use_cases/components/button_use_case.dart';
import 'use_cases/components/components_use_case.dart';

// ─── App Entry ────────────────────────────────────────────────────────────────
// ATENÇÃO: rode `dart run build_runner build` para gerar main.widgetbook.g.dart
// e então este arquivo usa o catálogo gerado automaticamente.
//
// Se preferir registro MANUAL (sem geração de código), use a estrutura abaixo:

void main() {
  runApp(const OkaWidgetbook());
}

class OkaWidgetbook extends StatelessWidget {
  const OkaWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // ── Addons ──────────────────────────────────────────────────────────────
      addons: [
        // Alterna entre dispositivos reais
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPhone13ProMax,
            Devices.android.samsungGalaxyS20,
            Devices.android.samsungGalaxyA50,
          ],
        ),
        // Alterna light/dark (preparado para futuro dark mode)
        ThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: _buildTheme()),
          ],
          themeBuilder: (context, theme, child) =>
              Theme(data: theme, child: child),
        ),
        // Alterna tamanho de texto para a11y
        TextScaleAddon(scales: [1.0, 1.2, 1.5]),
        // Alterna alinhamento
        AlignmentAddon(),
        // Adiciona grid de padding ao redor
        GridAddon(),
      ],

      // ── Catálogo manual ─────────────────────────────────────────────────────
      directories: [
        WidgetbookCategory(
          name: 'Tokens',
          children: [
            WidgetbookComponent(
              name: 'Cores',
              useCases: [
                WidgetbookUseCase(name: 'Primitivos — Blue',    builder: colorBlue),
                WidgetbookUseCase(name: 'Primitivos — Grey',    builder: colorGrey),
                WidgetbookUseCase(name: 'Primitivos — Yellow',  builder: colorYellow),
                WidgetbookUseCase(name: 'Primitivos — Green',   builder: colorGreen),
                WidgetbookUseCase(name: 'Primitivos — Red',     builder: colorRed),
                WidgetbookUseCase(name: 'Semânticos — Brand',   builder: colorBrand),
                WidgetbookUseCase(name: 'Semânticos — Text',    builder: colorText),
                WidgetbookUseCase(name: 'Semânticos — Feedback',builder: colorFeedback),
              ],
            ),
            WidgetbookComponent(
              name: 'Tipografia',
              useCases: [
                WidgetbookUseCase(name: 'Escala Tipográfica', builder: typographyScale),
              ],
            ),
            WidgetbookComponent(
              name: 'Espaçamento',
              useCases: [
                WidgetbookUseCase(name: 'Escala de Espaçamento', builder: spacingScale),
                WidgetbookUseCase(name: 'Border Radius',         builder: radiusScale),
              ],
            ),
          ],
        ),

        WidgetbookCategory(
          name: 'Componentes',
          children: [
            WidgetbookComponent(
              name: 'Botão',
              useCases: [
                WidgetbookUseCase(name: 'Botão', builder: buttonUseCase),
              ],
            ),
            WidgetbookComponent(
              name: 'Campo de Texto',
              useCases: [
                WidgetbookUseCase(name: 'Campo de Texto', builder: inputUseCase),
              ],
            ),
            WidgetbookComponent(
              name: 'Alert Message',
              useCases: [
                WidgetbookUseCase(name: 'Alert Message', builder: alertUseCase),
              ],
            ),
            WidgetbookComponent(
              name: 'Tag',
              useCases: [
                WidgetbookUseCase(name: 'Tag', builder: tagUseCase),
              ],
            ),
            WidgetbookComponent(
              name: 'Pílulas',
              useCases: [
                WidgetbookUseCase(name: 'Pílulas', builder: pillUseCase),
              ],
            ),
            WidgetbookComponent(
              name: 'Lista',
              useCases: [
                WidgetbookUseCase(name: 'Lista', builder: listUseCase),
              ],
            ),
          ],
        ),
      ],
    );
  }

  ThemeData _buildTheme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: OkaColors.brandPrimary),
        scaffoldBackgroundColor: OkaColors.bgLight,
        useMaterial3: true,
      );
}
