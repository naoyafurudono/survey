# programming 2021

## A Transient Semantics for Typed Racket

### Abstract を読んだ直後の理解

gradual typing の論文で言語デザインと実行効率について議論する。
Typed Racket の型システムは高い表現力を持つ一方で実行効率は悪い。
Reticulated Python はプアな表現力にとどめてなかなかの実行効率をもつ。

そこで Typed Racket の型システムをいじって Reticulated Python のやり方を取り入れてみた、というのがこの論文がやったこと。
その結果、言語の表現力がどうなったかとかパフォーマンスがどうなるかとかを議論するらしい。

ここでいう表現力というかに gradual typing 特有の議論の余地がある。Typed/untyped間での制約の伝搬のさせ方（migratory）とか型システムの健全性の保ち方とか。
Typed Racket はどっちもつよつよとのこと。

Reticulated Python は Transient semantics というのを採用していて、その意味論ではダイナミックな世界に型制約を持ち込む際に、いい感じのところに first-order のアサーションをつけるだけだとか。（ちなみに Transient ではない、フルの typed racket の意味論を Natural Semantics と呼んでいる）

なんかよくわからないけど、この論文でやった Typed Racket のいじり方がいくつかあるようで（オプションの on/off でいくつか分けるくらいの感じか？）結果が変わって面白いとか。

## Bitrot Revisited: Local First Software and Orthogonal Synchronization

by Gilad Brancha
Issue

- offline use
- wasted capacity at network use
- energy : 大規模サーバ
- data ownership and control
