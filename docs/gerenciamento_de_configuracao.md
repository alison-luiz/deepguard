# Plano de Gerenciamento de Configuração

## Objetivo

Definir um processo claro para o controle de versões, mudanças e itens de configuração do projeto.

## Versionamento

- **Política de Versionamento**: Utilização do SemVer (x.y.z).
- **Ferramenta**: Git como sistema de controle de versão.

## Controle de Mudanças

- **Solicitação de Mudança**: Qualquer alteração deve ser documentada e revisada.
- **Aprovação**: As mudanças devem ser aprovadas por pelo menos um desenvolvedor sênior.

## Identificação de Itens de Configuração

- **Código-Fonte**: Todos os arquivos no diretório `lib/`.
- **Documentação**: Todos os arquivos na pasta `docs/`.
- **Dependências**: Listadas e gerenciadas via `pubspec.yaml`.

## Procedimentos de Backup e Restauração

- **Backup**: Realizado semanalmente.
- **Restauração**: Realizada em caso de falha crítica, seguindo a última versão estável.
