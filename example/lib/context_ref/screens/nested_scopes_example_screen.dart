// ignore_for_file: unused_element_parameter

import 'dart:math';

import 'package:context_plus/context_plus.dart';
import 'package:flutter/material.dart';

final _globalState = Ref<_State>();
final _childrenAmount = Ref<ValueNotifier<int>>();

final _childColor = Ref<Color>();
final _name = Ref<String>();
final _message = Ref<String>();
final _state = Ref<_State>();

class _State {
  _State({
    required this.scopeName,
  });

  final String scopeName;

  final counter = ValueNotifier(0);

  void dispose() {
    debugPrint('_State($scopeName) was disposed');
  }
}

class NestedScopesExampleScreen extends StatelessWidget {
  const NestedScopesExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested scopes example'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final globalState = context.use(() => _State(scopeName: 'Global scope'));
    _globalState.bind(context, globalState);

    final childrenAmount = context.use(() => ValueNotifier(3));
    _childrenAmount.bind(context, childrenAmount);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Theme(
              data: ThemeData.dark(),
              child: DefaultTextStyle.merge(
                style: const TextStyle(
                  color: Colors.white,
                ),
                child: _ChildWrapper(
                  depth: 1,
                  maxDepth: childrenAmount.watch(context),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => childrenAmount.value++,
              child: const Text('Add scope'),
            ),
            TextButton(
              onPressed: () => childrenAmount.value--,
              child: const Text('Remove scope'),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.paddingOf(context).bottom,
        ),
      ],
    );
  }
}

class _ChildWrapper extends StatefulWidget {
  const _ChildWrapper({
    super.key,
    required this.depth,
    required this.maxDepth,
  });

  final int depth;
  final int maxDepth;

  @override
  State<_ChildWrapper> createState() => _ChildWrapperState();
}

class _ChildWrapperState extends State<_ChildWrapper> {
  static final scopeColors = [
    Colors.black,
    Colors.brown[900]!,
    Colors.green[900]!,
  ];

  late var _color = scopeColors[widget.depth % scopeColors.length];

  @override
  Widget build(BuildContext context) {
    _childColor.bind(context, _color);
    final name = _name.bind(context, 'Scope ${widget.depth}');
    _message.bind(context, 'Hello from $name');

    final state = context.use(() => _State(scopeName: name));
    _state.bind(context, state);

    return Stack(
      children: [
        _Child(
          child: widget.depth >= widget.maxDepth
              ? const SizedBox.shrink()
              : _ChildWrapper(
                  depth: widget.depth + 1,
                  maxDepth: widget.maxDepth,
                ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: TextButton(
            onPressed: () => setState(() {
              _color = Color.fromARGB(
                255,
                Random().nextInt(128),
                Random().nextInt(128),
                Random().nextInt(128),
              );
            }),
            child: const Text('Set random color'),
          ),
        ),
      ],
    );
  }
}

class _Child extends StatelessWidget {
  const _Child({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final bgColor = _childColor.of(context);
    final scopeName = _name.of(context);
    final message = _message.of(context);
    final state = _state.of(context);

    final globalState = _globalState.of(context);

    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Current scope: $scopeName'),
          Text('Message: $message'),
          Text('Counter: ${state.counter.watch(context)}'),
          Text('Global counter: ${globalState.counter.watch(context)}'),
          Row(
            children: [
              const Text('Increment: '),
              Expanded(
                child: TextButton(
                  onPressed: () => state.counter.value++,
                  child: const Text('Local'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => globalState.counter.value++,
                  child: const Text('Global'),
                ),
              ),
            ],
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
