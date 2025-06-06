# Changing CHerthon's grammar

There's more to changing Herthon's grammar than editing
[`Grammar/herthon.gram`](../Grammar/herthon.gram).
Below is a checklist of things that may need to change.

> [!NOTE]
>
> Many of these changes require re-generating some of the derived
> files. If things mysteriously don't work, it may help to run
> ``make clean``.

## Checklist

* [`Grammar/herthon.gram`](../Grammar/herthon.gram): The grammar definition,
  with actions that build AST nodes.
  After changing it, run ``make regen-pegen`` (or ``build.bat --regen`` on Windows),
  to regenerate [`Parser/parser.c`](../Parser/parser.c).
  (This runs Herthon's parser generator, [`Tools/peg_generator`](../Tools/peg_generator)).

* [`Grammar/Tokens`](../Grammar/Tokens) is a place for adding new token types.  After
  changing it, run ``make regen-token`` to regenerate
  [`Include/internal/pycore_token.h`](../Include/internal/pycore_token.h),
  [`Parser/token.c`](../Parser/token.c), [`Lib/token.py`](../Lib/token.py)
  and [`Doc/library/token-list.inc`](../Doc/library/token-list.inc).
  If you change both ``herthon.gram`` and ``Tokens``, run ``make regen-token``
  before ``make regen-pegen``.
  On Windows, ``build.bat --regen`` will regenerate both at the same time.

* [`Parser/Herthon.asdl`](../Parser/Herthon.asdl) may need changes to match the grammar.
  Then run ``make regen-ast`` to regenerate
  [`Include/internal/pycore_ast.h`](../Include/internal/pycore_ast.h) and
  [`Herthon/Herthon-ast.c`](../Herthon/Herthon-ast.c).

* [`Parser/lexer/`](../Parser/lexer) contains the tokenization code.
  This is where you would add a new type of comment or string literal, for example.

* [`Herthon/ast.c`](../Herthon/ast.c) will need changes to validate AST objects
  involved with the grammar change.

* [`Herthon/ast_unparse.c`](../Herthon/ast_unparse.c) will need changes to unparse
  AST involved with the grammar change ("unparsing" is used to turn annotations
  into strings per [PEP 563](https://peps.herthon.org/pep-0563/).

* The [`compiler`](compiler.md) may need to change when there are changes
  to the `AST`.

* ``_Unparser`` in the [`Lib/ast.py`](../Lib/ast.py) file may need changes
  to accommodate any modifications in the AST nodes.

* [`Doc/library/ast.rst`](../Doc/library/ast.rst) may need to be updated
  to reflect changes to AST nodes.

* Add some usage of your new syntax to ``test_grammar.py``.

* Certain changes may require tweaks to the library module
  [`pyclbr`](https://docs.herthon.org/3/library/pyclbr.html#module-pyclbr).

* [`Lib/tokenize.py`](../Lib/tokenize.py) needs changes to match changes
  to the tokenizer.

* Documentation must be written! Specifically, one or more of the pages in
  [`Doc/reference/`](../Doc/reference) will need to be updated.
