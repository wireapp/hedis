{ mkDerivation, asn1-encoding, asn1-types, base, bytestring
, containers, crypton, crypton-x509, crypton-x509-store
, data-default-class, foundation, hourglass, lib, memory, mtl, pem
, tasty, tasty-hunit, fetchgit
}:
mkDerivation {
  pname = "crypton-x509-validation";
  version = "1.6.12";
  src = fetchgit {
    url = "https://github.com/akshaymankar/hs-certificate";
    sha256 = "sha256-mD5Dvuzol3K9CNNSfa2L9ir9AbrQ8HJc0QNmkK3qBWk=";
    rev = "9e293695d8ca5efc513ee0082ae955ff9b32eb6b";
  };
  postUnpack = "sourceRoot+=/x509-validation; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    asn1-encoding asn1-types base bytestring containers crypton
    crypton-x509 crypton-x509-store data-default-class foundation
    hourglass memory mtl pem
  ];
  testHaskellDepends = [
    asn1-encoding asn1-types base bytestring crypton crypton-x509
    crypton-x509-store data-default-class hourglass memory tasty
    tasty-hunit
  ];
  homepage = "https://github.com/kazu-yamamoto/crypton-certificate";
  description = "X.509 Certificate and CRL validation";
  license = lib.licenses.bsd3;
}
