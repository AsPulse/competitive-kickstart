{
  description = "Rust environment for competitive programming";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ rust-overlay.overlays.default ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        cargo-compete = pkgs.callPackage ./cargo-compete/default.nix {};
        cargo-equip = pkgs.callPackage ./cargo-equip/default.nix {};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.rustup
            pkgs.cargo-udeps
            cargo-compete
            cargo-equip
          ];
          shellHook = ''
            exec $SHELL
          '';
        };
      }
    );
}
