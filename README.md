# context_plus

![context_plus.png](https://github.com/s0nerik/context_plus/raw/main/doc/context_plus.png)

A set of packages that provide a convenient way to propagate a value from a parent widget to its descendants and observe changes to any observable value.

## Packages

| Package                                                                                    | Pub                                                                                                    | Description                                                                                                                                                                                                                                                      |
|--------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [context_watch](https://github.com/s0nerik/context_plus/tree/main/packages/context_watch)  | [![context_watch](https://img.shields.io/pub/v/context_watch)](https://pub.dev/packages/context_watch) | `Listenable.watch(context)`<br/>`Listenable.watchOnly(context, () => ...)`<br/><br/>`Future.watch(context)`<br/>`Future.watchOnly(context, () => ...)`<br/><br/>`Stream.watch(context)`<br/>`Stream.watchOnly(context, () => ...)`                               |
| [context_ref](https://github.com/s0nerik/context_plus/tree/main/packages/context_ref)      | [![context_ref](https://img.shields.io/pub/v/context_ref)](https://pub.dev/packages/context_ref)       | `Ref.of(context)`<br/><br/>`Ref.bind(context, () => ...)`<br/>`Ref.bindLazy(context, () => ...)`<br/>`Ref.bindValue(context, ...)`                                                                                                                               |
| [context_plus](https://github.com/s0nerik/context_plus/tree/main/packages/context_plus)    | [![context_plus](https://img.shields.io/pub/v/context_plus)](https://pub.dev/packages/context_plus)    | `Ref<Listenable>.watch(context)`<br/>`Ref<Listenable>.watchOnly(context, () => ...)`<br/><br/>`Ref<Future>.watch(context)`<br/>`Ref<Future>.watchOnly(context, () => ...)`<br/><br/>`Ref<Stream>.watch(context)`<br/>`Ref<Stream>.watchOnly(context, () => ...)` |

## Integrations

| Package                                                                                                   | Pub                                                                                                                            | Description                                                                                                                              |
|-----------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| [context_watch_bloc](https://github.com/s0nerik/context_plus/tree/main/packages/context_watch_bloc)       | [![context_watch_bloc](https://img.shields.io/pub/v/context_watch_bloc)](https://pub.dev/packages/context_watch_bloc)          | `Bloc.watch(context)`<br/>`Bloc.watchOnly(context, () => ...)`<br/><br/>`Cubit.watch(context)`<br/>`Cubit.watchOnly(context, () => ...)` |
| [context_watch_mobx](https://github.com/s0nerik/context_plus/tree/main/packages/context_watch_mobx)       | [![context_watch_mobx](https://img.shields.io/pub/v/context_watch_mobx)](https://pub.dev/packages/context_watch_mobx)          | `Observable.watch(context)`<br/>`Observable.watchOnly(context, () => ...)`                                                               |
| [context_watch_getx](https://github.com/s0nerik/context_plus/tree/main/packages/context_watch_getx)       | [![context_watch_getx](https://img.shields.io/pub/v/context_watch_getx)](https://pub.dev/packages/context_watch_getx)          | `Rx.watch(context)`<br/>`Rx.watchOnly(context, () => ...)`                                                                               |
| [context_watch_signals](https://github.com/s0nerik/context_plus/tree/main/packages/context_watch_signals) | [![context_watch_signals](https://img.shields.io/pub/v/context_watch_signals)](https://pub.dev/packages/context_watch_signals) | `Signal.watch(context)`<br/>`Signal.watchOnly(context, () => ...)`                                                                       |
