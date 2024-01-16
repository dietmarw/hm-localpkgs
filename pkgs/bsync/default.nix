{ lib
, fetchFromGitHub
, stdenv
}:

stdenv.mkDerivation rec {
  pname = "bsync";
  version = "20231221-25f7773";

  src = fetchFromGitHub {
    owner  = "dooblem";
    repo   = "bsync";
    rev    = "25f77730750720ad68b0ab2773e79d9ca98c3647";
    hash   = "sha256-k25MjLis0/dp1TTS4aFeJZq/c0T01LmNcWtC+dw/kKY=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp bsync $out/bin
    chmod +x $out/bin/bsync
  '';
 
  meta = with lib; {
    homepage = "https://github.com/dooblem/bsync";
    description = "Bidirectional Synchronization using Rsync";
    license = licenses.gpl3Plus;
    maintainers = with maintainers;  [ "dietmarw" ];
    platforms = with lib.platforms; linux ++ darwin;
  };

}