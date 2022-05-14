# incremental

Incremental computationのサーベイ。
メモ化はアルゴリズムに対するものとしての意味合いが大きくて、実装方法はナイーブ。
Incremental computationはアイデアは似ているけど、計算の種類がことなるイメージ。
（一般の）ソフトウェアに対するものが該当しそう。

副作用がどうこうで計算結果の再利用ができるかが決まる。エフェクトシステムはどれくらい影響を与えるかとか、代数的エフェクトがあるときに、エフェクトシステムとともにどのような嬉しさを見いだせるかを考えたい。

# 文献

次はどちらもたくさん引用されている。

- [A Type and Effect System for Deterministic Parallel Java (OOPSLA2009)](https://dl.acm.org/doi/abs/10.1145/1640089.1640097?casa_token=FJRQiTuakakAAAAA:9yPqcV7vMTU28fWrNR3hDK9X0qyrdUF3E9GcRmxqhO-ZIMnLXFEaEUDPQbtNeN2t6i48-J_sBNjhJPU)
- [Monads for incremental computing (ICFP2002)](https://dl.acm.org/doi/abs/10.1145/581478.581482)

MultiCore OCamlでconcurrent programmingの話。incrementalとはあまり関係ない？

- [(github)](https://github.com/ocamllabs/ocaml-effects-tutorial)
- [Concurrent System Programming with Effect Handlers](https://link.springer.com/chapter/10.1007/978-3-319-89719-6_6) (need VPN)

