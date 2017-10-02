with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "ghc-env";
  ghc = pkgs.haskell.packages.ghc802.ghcWithPackages (pkgs: with pkgs; [
          base ghc-mod hlint apply-refact stylish-haskell hasktags hoogle
        ]);

  buildInputs = [ haskellPackages.ghc-mod haskellPackages.alex haskellPackages.happy haskellPackages.hlint gcc ncurses automake autoconf libiconv binutils coreutils gmp];

  configureFlags = [
    "CC=${stdenv.cc}/bin/cc"
    "--with-curses-includes=${ncurses.dev}/include" "--with-curses-libraries=${ncurses.out}/lib"
    "--datadir=$doc/share/doc/ghc"
    "--with-gmp-includes=${gmp.dev}/include" "--with-gmp-libraries=${gmp.out}/lib"
  ];
}

