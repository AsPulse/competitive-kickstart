{ lib, rustPlatform, fetchFromGitHub, pkgs }:

rustPlatform.buildRustPackage rec {
  pname = "cargo-compete";
  version = "0.10.6";

  src = fetchFromGitHub {
    owner = "qryxip";
    repo = "cargo-compete";
    rev = "v${version}";
    sha256 = "sha256-trtnxWDXzCeZ7ICLbPgCrBFZZzOmpkGOjjrpus6t+is=";
  };

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    openssl.dev
    libiconv
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  # OPENSSL_INCLUDE_DIR = (
  #   lib.makeSearchPathOutput "dev" "include" [ pkgs.openssl.dev ]
  # ) + "/openssl";

  # OPENSSL_STATIC = "0";

  cargoHash = "sha256-A8DAsbQDu9I8vEuDxBszADm45Q8NjnMDO8mD+ADl224=";

  doCheck = false;

  meta = with lib; {
    description = "A Cargo subcommand for competitive programming";
    maintainers = with maintainers; [ aspulse ];
  };
}
