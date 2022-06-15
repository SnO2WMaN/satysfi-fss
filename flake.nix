{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      rec {
        packages.fss = pkgs.stdenv.mkDerivation {
          name = "satysfiPackages.satysfi-fss";
          src = self;
          installPhase = "mkdir -p $out; cp -r src/fss $out";
        };
        packages.fontset-bodoni-star = pkgs.stdenv.mkDerivation {
          name = "satysfiPackages.satysfi-fss";
          src = self;
          installPhase = "mkdir -p $out; cp -r src/fss-fontset-bodoni-star $out";
        };
        packages.sss = pkgs.stdenv.mkDerivation {
          name = "satysfiPackages.satysfi-fss";
          src = self;
          buildInputs = [ packages.fss ];
          installPhase = "mkdir -p $out; cp -r src/sss $out";
        };
        packages.class-nzla = pkgs.stdenv.mkDerivation {
          name = "satysfiPackages.satysfi-fss";
          src = self;
          installPhase = "mkdir -p $out; cp -r src/class-nzla $out";
        };
      }
    );
}
