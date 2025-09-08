import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/quiz/domain/entity/question_entity.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz_event.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz_state.dart';
import 'package:quiz_application/quiz/presentation/widgets/question_card.dart';

class CardStackAnimated extends StatefulWidget {
  const CardStackAnimated({super.key});

  @override
  State<CardStackAnimated> createState() => _CardStackAnimatedState();
}

class _CardStackAnimatedState extends State<CardStackAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slide;
  late Animation<double> _rotate;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slide = Tween<double>(
      begin: 0,
      end: -400,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _rotate = Tween<double>(
      begin: 0,
      end: -0.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<QuizBloc>().add(QuizNextQuestionEnd());
        _controller.reset();
      }
    });
  }

  void _onOptionSelected(String optionId, bool isAnimated) {
    if (isAnimated) return;
  context.read<QuizBloc>().add(());
    context.read<QuizBloc>().add(QuizAnswered());
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          final List<QuestionEntity>? questions = state.quiz?.questions;
          if (questions == null || questions.isEmpty) {
            return const Center(child: Text("No questions available"));
          }
          final bool hasNext =
              state.currentQuestionIndex < questions.length - 1;
          final QuestionEntity currQuestion =
              questions[state.currentQuestionIndex];
          final QuestionEntity? nextQuestion =
              hasNext ? questions[state.currentQuestionIndex + 1] : null;

          return Stack(
            children: [
              if (hasNext)
                QuestionCard(
                  question: nextQuestion!,
                  onOptionSelected: (answerId) {
                    _onOptionSelected(answerId, state.isAnimated);
                  },
                ),

              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_slide.value, 0),
                    child: Transform.rotate(angle: _rotate.value, child: child),
                  );
                },
                child: QuestionCard(
                  question: currQuestion,
                  onOptionSelected: (answerId) {
                    _onOptionSelected(answerId, state.isAnimated);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
