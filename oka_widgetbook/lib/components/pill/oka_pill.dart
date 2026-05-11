import 'package:flutter/material.dart';
import '../../design_system/tokens/oka_tokens.dart';

enum OkaPillVariation { emLinha, empilhado }

class OkaPill extends StatefulWidget {
  const OkaPill({
    super.key,
    this.variation = OkaPillVariation.emLinha,
    this.options = const ['Opção 1', 'Opção 2', 'Opção 3'],
    this.initialSelected = 0,
  });

  final OkaPillVariation variation;
  final List<String> options;
  final int initialSelected;

  @override
  State<OkaPill> createState() => _OkaPillState();
}

class _OkaPillState extends State<OkaPill> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected;
  }

  Widget _buildItem(int i) {
    final isSelected = _selected == i;
    return GestureDetector(
      onTap: () => setState(() => _selected = i),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? OkaColors.brandPrimary : OkaColors.bgLight,
          borderRadius: BorderRadius.circular(OkaBorderRadius.large),
          border: Border.all(
            color: isSelected ? OkaColors.strokePrimary : OkaColors.strokeDefault,
          ),
        ),
        child: Text(
          widget.options[i],
          style: OkaTypography.body600.copyWith(
            color: isSelected ? OkaColors.labelPrimary : OkaColors.textDefault,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(widget.options.length, _buildItem);
    if (widget.variation == OkaPillVariation.emLinha) {
      return Wrap(spacing: 8, children: items);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((w) => Padding(padding: const EdgeInsets.only(bottom: 8), child: w)).toList(),
    );
  }
}
