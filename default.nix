{ lib, rustPlatform, fetchFromGitHub, pkgs }:

rustPlatform.buildRustPackage rec {
  pname = "cargo-equip";
  version = "0.20.1";

  src = fetchFromGitHub {
    owner = "qryxip";
    repo = "cargo-equip";
    rev = "v${version}";
    sha256 = "sha256-yxRiG96jC7zdlMQpL0B9Mle2kD1TOhqTZzMX3I8IE9I=";
  };

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    openssl.dev
    libiconv
  ];

  cargoHash = "sha256-CMCmWQZksAXXQZ4QhWv6jnZqsfLy+1+/6WjWQGSCZCI=";

  doCheck = false;

  meta = with lib; {
    description = "A Cargo subcommand to bundle your code into one `.rs` file for competitive programming";
    maintainers = with maintainers; [ aspulse ];
  };
}
