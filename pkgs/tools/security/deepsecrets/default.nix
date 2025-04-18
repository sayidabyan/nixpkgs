{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "deepsecrets";
  version = "1.0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "avito-tech";
    repo = "deepsecrets";
    tag = "v${version}";
    hash = "sha256-VfIsPgStHcIYGbfrOs1mvgoq0ZoVSZwILFVBeMt/5Jc=";
  };

  pythonRelaxDeps = [
    "pyyaml"
    "regex"
    "mmh3"
  ];

  nativeBuildInputs = with python3.pkgs; [
    poetry-core
  ];

  propagatedBuildInputs = with python3.pkgs; [
    dotwiz
    mmh3
    ordered-set
    pydantic_1
    pygments
    pyyaml
    regex
  ];

  pythonImportsCheck = [
    "deepsecrets"
  ];

  meta = with lib; {
    description = "Secrets scanner that understands code";
    mainProgram = "deepsecrets";
    homepage = "https://github.com/avito-tech/deepsecrets";
    changelog = "https://github.com/avito-tech/deepsecrets/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
