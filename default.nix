{ mkDerivation, async, base, bytestring, bytestring-lexing
, containers, crypton-x509-store, deepseq, errors, exceptions, HTTP
, HUnit, lib, mtl, network, network-uri, resource-pool, scanner
, stm, test-framework, test-framework-hunit, text, time, tls
, unliftio-core, unordered-containers, vector
}:
mkDerivation {
  pname = "hedis";
  version = "0.15.2";
  src = ./.;
  libraryHaskellDepends = [
    async base bytestring bytestring-lexing containers deepseq errors
    exceptions HTTP mtl network network-uri resource-pool scanner stm
    text time tls unliftio-core unordered-containers vector
  ];
  testHaskellDepends = [
    async base bytestring crypton-x509-store HUnit mtl stm
    test-framework test-framework-hunit text time tls
  ];
  benchmarkHaskellDepends = [ base mtl time ];
  homepage = "https://github.com/informatikr/hedis";
  description = "Client library for the Redis datastore: supports full command set, pipelining";
  license = lib.licenses.bsd3;
}
