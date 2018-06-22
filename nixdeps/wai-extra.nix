{ mkDerivation, aeson, ansi-terminal, base, base64-bytestring
, bytestring, case-insensitive, containers, cookie
, data-default-class, deepseq, directory, fast-logger, fetchgit
, hspec, http-types, HUnit, iproute, lifted-base, network
, old-locale, resourcet, stdenv, streaming-commons, stringsearch
, text, time, transformers, unix, unix-compat, vault, void, wai
, wai-logger, word8, zlib
}:
mkDerivation {
  pname = "wai-extra";
  version = "3.0.22.1";
  src = fetchgit {
    url = "https://github.com/chessai/wai";
    sha256 = "1n32cphadgg6m07yfdabzi2g842igjfszr9i0p8iz3xghsb8xjxw";
    rev = "6fe9707f243549cb10b37e5b12b232e022017ac4";
  };
  postUnpack = "sourceRoot+=/wai-extra; echo source root reset to $sourceRoot";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson ansi-terminal base base64-bytestring bytestring
    case-insensitive containers cookie data-default-class deepseq
    directory fast-logger http-types iproute lifted-base network
    old-locale resourcet streaming-commons stringsearch text time
    transformers unix unix-compat vault void wai wai-logger word8 zlib
  ];
  testHaskellDepends = [
    base bytestring case-insensitive cookie fast-logger hspec
    http-types HUnit resourcet text time transformers wai zlib
  ];
  homepage = "http://github.com/yesodweb/wai";
  description = "Provides some basic WAI handlers and middleware";
  license = stdenv.lib.licenses.mit;
}
