# ghc-shell.nix
A shell.nix file to build GHC (Glasgow Haskell Compiler) on NixOS.

In other words: Some parts of `haskell.compiler.ghcHEAD` (https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/compilers/ghc/head.nix) translated to a shell.nix file. 

_Disclaimer_: This works for me on my machine. I might have forgotten some dependencies that were already installed in my environment. Please put me a note or make a pull request if you had to tweak this `shell.nix` file further.

## Usage
- Clone the GHC Git repository as described in https://ghc.haskell.org/trac/ghc/wiki/Building/GettingTheSources.
- Copy the `shell.nix` file to the root of the GHC source directory.
- Execute `nix-shell` in that directory.
- Build as usual but use `$configureFlags` for the `configure` script.

So, if you cloned the GHC repository to `/home/username/src/ghc` and this repository to `/home/username/src/ghc-shell.nix`:
```bash
cd /home/username/src/ghc
cp /home/username/src/ghc-shell.nix/shell.nix .

#edit mk/build.mk as usual

nix-shell # this will fork a new shell with all tools needed to build GHC

./boot
./configure $configureFlags

make # use more cores with -j NUM_OF_CORES, e.g. -j8
```

## Additional Packages
There are some additional packages in this `shell.nix` that make development more convenient:
- ghc-mod 
- hlint 
- apply-refact 
- stylish-haskell 
- hasktags 
- hoogle

## Alternatives
- `shell.nix` of @mpickering : https://gist.github.com/mpickering/002fbdd0db02dee43c2af35e5cfb0c91
