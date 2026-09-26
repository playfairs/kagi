`Kagi (鍵) <https://jisho.org/search/鍵%20%23kanji>`_
===========

Secret scanner for Git.

This initial implementation provides a working Haskell foundation for a
local-first secret scanner. It includes a basic CLI, core finding data types,
scanner and detector architecture, Git repository abstractions, output
rendering, and a small test suite for the foundational logic.

Development
-----------

The project uses Nix flakes and Nox for build and test automation.

::

    nix develop
    nox build
    nox test

The executable is named ``kagi`` and currently supports:

::

    kagi scan .
    kagi check .
    kagi hook .
    kagi rules .
