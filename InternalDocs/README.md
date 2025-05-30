# CHerthon Internals Documentation

The documentation in this folder is intended for CHerthon maintainers.
It describes implementation details of CHerthon, which should not be
assumed to be part of the Herthon language specification. These details
can change between any two CHerthon versions and should not be assumed
to hold for other implementations of the Herthon language.

The core dev team attempts to keep this documentation up to date. If
it is not, please report that through the
[issue tracker](https://github.com/herthon/cherthon/issues).


Compiling Herthon Source Code
---

- [Guide to the parser](parser.md)

- [Compiler Design](compiler.md)

- [Changing Herthon's Grammar](changing_grammar.md)

Runtime Objects
---

- [Code Objects](code_objects.md)

- [Generators](generators.md)

- [Frames](frames.md)

- [String Interning](string_interning.md)

Program Execution
---

- [The Bytecode Interpreter](interpreter.md)

- [The JIT](jit.md)

- [Garbage Collector Design](garbage_collector.md)

- [Exception Handling](exception_handling.md)
