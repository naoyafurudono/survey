# incremental

Incremental computationのサーベイ。
メモ化はアルゴリズムに対するものとしての意味合いが大きくて、実装方法はナイーブ。
Incremental computationはアイデアは似ているけど、計算の種類がことなるイメージ。
（一般の）ソフトウェアに対するものが該当しそう。

副作用がどうこうで計算結果の再利用ができるかが決まる。エフェクトシステムはどれくらい影響を与えるかとか、代数的エフェクトがあるときに、エフェクトシステムとともにどのような嬉しさを見いだせるかを考えたい。

副作用に代数的エフェクトだけを用いると、外部への依存性はパラメータとエフェクトハンドラだけになる。
エフェクトハンドラでは依存性が生じた時点での継続をとれる。言い換えると依存性が生じる以前の計算を反映した評価文脈が得られる。
普通のincremental computationがどうしているかは定かではないが、特定の関数の引数をみるとか、もっと大きな単位のスレッドみたいなもののパラメータをみて、それらを再実行するか判断するのではないだろうか。
そう思うとエフェクトハンドラを用いるときめ細かい分割ができるし、おそらくそれよりも大事なこととして本当に依存性が発生する部分を（割とプログラマの手を煩わせないやり方で）切り出せる。

懸念は代数的エフェクトと相性が良いエフェクトはincremental computationで外部と依存したくなるようなものか、ということ。
可変状態は別にエフェクトハンドラでやることはないだろう。コントロールフローが絡んでくるとエフェクトハンドラが便利な感じがする。

エフェクトシステムとincrementalの相性は良さそう。こちらはエフェクトハンドラとどれくらい絡みがでるだろうか。
基本はメモリ管理な気がする。
そもそもincrementalではフレームワークにどれくらい期待するだろうか。今までの環境での辛みを知りたい。

# 文献

次はどちらもたくさん引用されている。

- [A Type and Effect System for Deterministic Parallel Java (OOPSLA2009)](https://dl.acm.org/doi/abs/10.1145/1640089.1640097?casa_token=FJRQiTuakakAAAAA:9yPqcV7vMTU28fWrNR3hDK9X0qyrdUF3E9GcRmxqhO-ZIMnLXFEaEUDPQbtNeN2t6i48-J_sBNjhJPU)
- [Monads for incremental computing (ICFP2002)](https://dl.acm.org/doi/abs/10.1145/581478.581482)

MultiCore OCamlでconcurrent programmingの話。incrementalとはあまり関係ない？

- [(github)](https://github.com/ocamllabs/ocaml-effects-tutorial)
- [Concurrent System Programming with Effect Handlers](https://link.springer.com/chapter/10.1007/978-3-319-89719-6_6) (need VPN)

Incremental for compiler.

- [Three Architectures for a Responsive IDE](https://rust-analyzer.github.io/blog/2020/07/20/three-architectures-for-responsive-ide.html)
    - IDE向けコンパイラのざっくりとした構成。特にコード補完のための依存性解析について。
    - rust-analyzerは（少なくとも）2020年当時はfine-grainなincremental computingをしていたみたい。コンパイル単位が大きいのでindexを取るのが難しいからだとか。コンパイラの実行パスや部分的な実行結果を保存して再利用性を判定しているのだとか。
        - 具体的にどのような条件を観察しているか気になる。proc-macroの非決定性によるバグがあった、とは言っていたが、コンパイラで副作用が起きるケースはなかなかなさそう。非決定性由来のバグもそんなものあるのか、と驚いた。キャッシュ可能性を判定するために副作用のなさを保証したくなって、そのためにエフェクトシステムは強いことをできそう。コンパイラ最適化としてどのくらい自動でincrementalなことをできるか？Haskellはすでにできそうで、昔軽く調べたことがあるのだけれど、それらしい情報にはたどり着けなかった。せいぜいモナドでメモ化をおしゃれに関数に追加するくらい。
    - C++はヘッダファイルが、Javaはファイル単位の意味が良い仕事をしていてIDE向けのindexingに優しいとか。
- [Architecture of rust-analyzer](https://github.com/rust-lang/rust-analyzer/blob/master/docs/dev/architecture.md)
    - 開発者向けドキュメント。上の記事を読んでからこの記事を読んでいるの。今の所この順番で読んで良かったと思っている。
    - Kokaにもこんなドキュメントがあったら、と思わずにいられない。まあ、このドキュメントと実装が対応しているかはわからないが。
- [Why the Sorbet typechecker is fast](https://blog.nelhage.com/post/why-sorbet-is-fast/)
    - Ruby向けの型検査器の実装について。高速化のためのデザインを解説している。詳細ではなく方針。
    - Rustの記事でおすすめされていた。<https://rust-analyzer.github.io/blog/2020/05/18/next-few-years.html>


