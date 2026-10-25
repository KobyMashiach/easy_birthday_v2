import 'dart:math' as math;

import 'package:easy_birthday/core/constants/app_colors.dart';
import 'package:easy_birthday/core/constants/app_text_styles.dart';
import 'package:easy_birthday/core/utils/i18n/strings.g.dart';
import 'package:easy_birthday/core/widgets/general/appbar.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/confetti_widget.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/empty_category_view.dart';
import 'package:easy_birthday/features/category_display/presentation/widgets/look_alike/look_alike_widgets.dart';
import 'package:easy_birthday/features/event/data/models/category_model.dart';
import 'package:easy_birthday/features/event/data/models/child_model.dart';
import 'package:easy_birthday/features/event/data/models/look_alike_model.dart';
import 'package:easy_birthday/features/home/presentation/utils/category_templates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// "Who do they look like?": for each child and feature the partner picks a
/// parent; a tug-of-war bar shows who's winning, and the result crowns the
/// parent the child looks like (with confetti).
class DisplayLookAlike extends StatefulWidget {
  final CategoryModel category;
  final void Function(Map<String, String> answers) onDone;

  const DisplayLookAlike({
    super.key,
    required this.category,
    required this.onDone,
  });

  @override
  State<DisplayLookAlike> createState() => _DisplayLookAlikeState();
}

class _DisplayLookAlikeState extends State<DisplayLookAlike> {
  late final LookAlikeModel? model = widget.category.lookAlike;
  late final List<ChildModel> children = [
    for (final child in childrenOf(widget.category))
      if (model?.childImageUrls[child.id] != null) child,
  ];
  late final List<(ChildModel, LookAlikeFeature)> rounds = [
    for (final child in children)
      for (final feature in LookAlikeFeature.values) (child, feature),
  ];
  late final Map<String, String> answers = {...?model?.partnerAnswers};
  late bool finished = model?.lock ?? false;
  int round = 0;

  /// The parent just picked, highlighted until the next round.
  String? picked;

  Future<void> _pick(String answer) async {
    if (picked != null || finished) return;
    HapticFeedback.lightImpact();
    final (child, feature) = rounds[round];
    setState(() {
      picked = answer;
      answers[lookAlikeKey(child.id, feature)] = answer;
    });
    await Future.delayed(const Duration(milliseconds: 450));
    if (!mounted) return;
    if (round == rounds.length - 1) {
      HapticFeedback.heavyImpact();
      widget.onDone(answers);
      setState(() => finished = true);
    } else {
      setState(() {
        round++;
        picked = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final LookAlikeModel? model = this.model;
    if (model == null || children.isEmpty) {
      return EmptyCategoryView(category: widget.category);
    }
    return Scaffold(
      appBar: appAppBar(title: widget.category.displayTitle),
      backgroundColor: const Color(0xFFFFF8FB),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          finished ? _results(model) : _game(model),
          if (finished) const ScreenConfettiWidget(),
        ],
      ),
    );
  }

  Widget _game(LookAlikeModel model) {
    final (child, feature) = rounds[round];
    final names = lookAlikeParentNames();
    final (owner, partner) = lookAlikeScore(answers, child.id);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(
              end: (round + (picked != null ? 1 : 0)) / rounds.length,
            ),
            duration: const Duration(milliseconds: 350),
            builder: (context, value, _) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 10,
                color: AppColors.disableColor,
                backgroundColor: Colors.black12,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "${round + 1} / ${rounds.length}",
            style: AppTextStyle().dropDownValues,
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Column(
              key: ValueKey(child.id),
              children: [
                RoundPhoto(
                  url: model.childImageUrls[child.id],
                  name: child.name,
                  size: 150,
                  border: AppColors.primaryColor,
                ),
                const SizedBox(height: 6),
                Text(child.name, style: AppTextStyle().title),
              ],
            ),
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            transitionBuilder: (child, animation) => SlideTransition(
              position: Tween(
                begin: const Offset(0.3, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: Column(
              key: ValueKey(round),
              children: [
                Text(feature.emoji, style: const TextStyle(fontSize: 56)),
                Text(
                  t.whose_feature(feature: feature.label, name: child.name),
                  textAlign: TextAlign.center,
                  style: AppTextStyle().subTitle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _ParentButton(
                  url: model.ownerImageUrl,
                  name: names.owner,
                  selected: picked == LookAlikeModel.owner,
                  dimmed: picked == LookAlikeModel.partner,
                  onTap: () => _pick(LookAlikeModel.owner),
                ),
              ),
              Text(
                "VS",
                style: AppTextStyle().title.copyWith(color: Colors.black26),
              ),
              Expanded(
                child: _ParentButton(
                  url: model.partnerImageUrl,
                  name: names.partner,
                  selected: picked == LookAlikeModel.partner,
                  dimmed: picked == LookAlikeModel.owner,
                  onTap: () => _pick(LookAlikeModel.partner),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          _TugOfWar(owner: owner, partner: partner),
        ],
      ),
    );
  }

  Widget _results(LookAlikeModel model) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      children: [
        for (final child in children)
          _ChildResult(
            child: child,
            model: model,
            answers: answers,
          ),
      ],
    );
  }
}

class _ParentButton extends StatelessWidget {
  final String? url;
  final String name;
  final bool selected;
  final bool dimmed;
  final VoidCallback onTap;

  const _ParentButton({
    required this.url,
    required this.name,
    required this.selected,
    required this.dimmed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: selected ? 1.15 : (dimmed ? 0.85 : 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        child: AnimatedOpacity(
          opacity: dimmed ? 0.4 : 1,
          duration: const Duration(milliseconds: 200),
          child: Column(
            children: [
              RoundPhoto(
                url: url,
                name: name,
                size: 110,
                border: selected ? Colors.amber : Colors.white,
              ),
              const SizedBox(height: 6),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  name,
                  style: AppTextStyle().description.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A rope whose knot slides toward the parent with more picks.
class _TugOfWar extends StatelessWidget {
  final int owner;
  final int partner;

  const _TugOfWar({required this.owner, required this.partner});

  @override
  Widget build(BuildContext context) {
    final int total = owner + partner;
    // -1 all owner (start side) … +1 all partner (end side).
    final double balance = total == 0 ? 0 : (partner - owner) / total;
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: balance),
            duration: const Duration(milliseconds: 600),
            curve: Curves.elasticOut,
            builder: (context, value, _) => Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(value * 0.85, 0),
                  child: const Text("🎀", style: TextStyle(fontSize: 34)),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$owner", style: AppTextStyle().subTitle),
            Text("$partner", style: AppTextStyle().subTitle),
          ],
        ),
      ],
    );
  }
}

class _ChildResult extends StatefulWidget {
  final ChildModel child;
  final LookAlikeModel model;
  final Map<String, String> answers;

  const _ChildResult({
    required this.child,
    required this.model,
    required this.answers,
  });

  @override
  State<_ChildResult> createState() => _ChildResultState();
}

class _ChildResultState extends State<_ChildResult>
    with SingleTickerProviderStateMixin {
  late final AnimationController _crown;

  @override
  void initState() {
    super.initState();
    _crown = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _crown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ChildModel child = widget.child;
    final LookAlikeModel model = widget.model;
    final names = lookAlikeParentNames();
    final (owner, partner) = lookAlikeScore(widget.answers, child.id);
    final String? winner = owner == partner
        ? null
        : (owner > partner ? LookAlikeModel.owner : LookAlikeModel.partner);
    final String? winnerUrl = switch (winner) {
      LookAlikeModel.owner => model.ownerImageUrl,
      LookAlikeModel.partner => model.partnerImageUrl,
      _ => null,
    };
    final int guessed = [
      for (final feature in LookAlikeFeature.values)
        if (model.ownerAnswers[lookAlikeKey(child.id, feature)] != null)
          feature,
    ].length;
    final int agreed = [
      for (final feature in LookAlikeFeature.values)
        if (model.ownerAnswers[lookAlikeKey(child.id, feature)]
            case final String a
            when a == widget.answers[lookAlikeKey(child.id, feature)])
          feature,
    ].length;

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        // Room for the winner's crown above the photos.
        padding: const EdgeInsets.fromLTRB(18, 44, 18, 18),
        child: Column(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 900),
              curve: Curves.elasticOut,
              builder: (context, v, child) =>
                  Transform.scale(scale: v, child: child),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundPhoto(
                      url: model.childImageUrls[child.id],
                      name: child.name,
                      size: 110,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("💞", style: TextStyle(fontSize: 34)),
                    ),
                    if (winner == null)
                      const Text("👨‍👩‍👧", style: TextStyle(fontSize: 64))
                    else
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          RoundPhoto(
                            url: winnerUrl,
                            name: lookAlikeParentName(winner),
                            size: 110,
                            border: Colors.amber,
                          ),
                          AnimatedBuilder(
                            animation: _crown,
                            builder: (context, child) => Positioned(
                              top: -30 - 6 * _crown.value,
                              child: Transform.rotate(
                                angle: (_crown.value - 0.5) * 0.3,
                                child: child,
                              ),
                            ),
                            child: const Text(
                              "👑",
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              winner == null
                  ? t.look_alike_tie(name: child.name)
                  : (child.isGirl
                        ? t.look_alike_winner_girl(
                            name: child.name,
                            parent: lookAlikeParentName(winner),
                          )
                        : t.look_alike_winner_boy(
                            name: child.name,
                            parent: lookAlikeParentName(winner),
                          )),
              textAlign: TextAlign.center,
              style: AppTextStyle().title,
            ),
            Text(
              "${names.owner} $owner : $partner ${names.partner}",
              style: AppTextStyle().description,
            ),
            if (guessed > 0)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  t.look_alike_agreed(agreed: agreed, total: guessed),
                  textAlign: TextAlign.center,
                  style: AppTextStyle().smallDescription,
                ),
              ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                for (final (index, feature) in LookAlikeFeature.values.indexed)
                  if (widget.answers[lookAlikeKey(child.id, feature)]
                      case final String answer)
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: Duration(milliseconds: 400 + index * 120),
                      curve: Curves.easeOutBack,
                      builder: (context, v, child) => Transform.scale(
                        scale: math.max(0, v),
                        child: child,
                      ),
                      child: Chip(
                        avatar: Text(feature.emoji),
                        backgroundColor: answer == LookAlikeModel.owner
                            ? Colors.blue.shade50
                            : Colors.pink.shade50,
                        label: Text(
                          "${feature.label} · ${lookAlikeParentName(answer)}",
                          style: AppTextStyle().dropDownValues,
                        ),
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
