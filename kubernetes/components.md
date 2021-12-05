## Master components

### kube-apiserver

O servidor de API é um componente da Camada de gerenciamento do Kubernetes que expõe a API do Kubernetes. O servidor de API é o front end para a camada de gerenciamento do Kubernetes.

A principal implementação de um servidor de API do Kubernetes é kube-apiserver. O kube-apiserver foi projetado para ser escalonado horizontalmente — ou seja, ele pode ser escalado com a implantação de mais instâncias. Você pode executar várias instâncias do kube-apiserver e balancear (balanceamento de carga, etc) o tráfego entre essas instâncias.

### etcd

Armazenamento do tipo Chave-Valor consistente e em alta-disponibilidade usado como repositório de apoio do Kubernetes para todos os dados do cluster.

Se o seu cluster Kubernetes usa etcd como seu armazenamento de apoio, certifique-se de ter um plano de back up para seus dados.

Você pode encontrar informações detalhadas sobre o etcd na seção oficial da documentação.

### kube-scheduler

Componente da camada de gerenciamento que observa os pods recém-criados sem nenhum nó atribuído, e seleciona um nó para executá-los.

Os fatores levados em consideração para as decisões de agendamento incluem: requisitos de recursos individuais e coletivos, hardware/software/política de restrições, especificações de afinidade e antiafinidade, localidade de dados, interferência entre cargas de trabalho, e prazos.

### kube-controller-manager

Componente da camada de gerenciamento que executa os processos de controlador.

Logicamente, cada controlador está em um processo separado, mas para reduzir a complexidade, eles todos são compilados num único binário e executam em um processo único.

Alguns tipos desses controladores são:

**Controlador de nó**: responsável por perceber e responder quando os nós caem.
**Controlador de Job**: Observa os objetos Job que representam tarefas únicas e, em seguida, cria pods para executar essas tarefas até a conclusão.
**Controlador de endpoints**: preenche o objeto Endpoints (ou seja, junta os Serviços e os pods).
**Controladores de conta de serviço e de token**: crie contas padrão e tokens de acesso de API para novos namespaces.

### cloud-controller-manager

Um componente da camada de gerenciamento do Kubernetes que incorpora a lógica de controle específica da nuvem. O gerenciador de controle de nuvem permite que você vincule seu cluster na API do seu provedor de nuvem, e separar os componentes que interagem com essa plataforma de nuvem a partir de componentes que apenas interagem com seu cluster.
O cloud-controller-manager executa apenas controladores que são específicos para seu provedor de nuvem. Se você estiver executando o Kubernetes em suas próprias instalações ou em um ambiente de aprendizagem dentro de seu próprio PC, o cluster não possui um gerenciador de controlador de nuvem.

Tal como acontece com o kube-controller-manager, o cloud-controller-manager combina vários ciclos de controle logicamente independentes em um binário único que você executa como um processo único. Você pode escalar horizontalmente (exectuar mais de uma cópia) para melhorar o desempenho ou para auxiliar na tolerância a falhas.

Os seguintes controladores podem ter dependências de provedor de nuvem:

Controlador de nó: para verificar junto ao provedor de nuvem para determinar se um nó foi excluído da nuvem após parar de responder.
Controlador de rota: para configurar rotas na infraestrutura de nuvem subjacente.
Controlador de serviço: Para criar, atualizar e excluir balanceadores de carga do provedor de nuvem.

## Node Components

### kubelet

Um agente que é executado em cada node no cluster. Ele garante que os contêineres estejam sendo executados em um Pod.

O kubelet utiliza um conjunto de PodSpecs que são fornecidos por vários mecanismos e garante que os contêineres descritos nesses PodSpecs estejam funcionando corretamente. O kubelet não gerencia contêineres que não foram criados pelo Kubernetes.

### kube-proxy

kube-proxy é um proxy de rede executado em cada nó no seu cluster, implementando parte do conceito de serviço do Kubernetes.

kube-proxy mantém regras de rede nos nós. Estas regras de rede permitem a comunicação de rede com seus pods a partir de sessões de rede dentro ou fora de seu cluster.

kube-proxy usa a camada de filtragem de pacotes do sistema operacional se houver uma e estiver disponível. Caso contrário, o kube-proxy encaminha o tráfego ele mesmo.

### Container runtime
O agente de execução (runtime) de contêiner é o software responsável por executar os contêineres.

O Kubernetes suporta diversos agentes de execução de contêineres: Docker, containerd, CRI-O, e qualquer implementação do Kubernetes CRI (Container Runtime Interface).

## Addons

Complementos (addons) usam recursos do Kubernetes (DaemonSet, Deployment, etc) para implementar funcionalidades do cluster. Como fornecem funcionalidades em nível do cluster, recursos de addons que necessitem ser criados dentro de um namespace pertencem ao namespace kube-system.

Alguns addons selecionados são descritos abaixo; para uma lista estendida dos addons disponíveis, por favor consulte Addons.

### DNS
Embora os outros complementos não sejam estritamente necessários, todos os clusters do Kubernetes devem ter um DNS do cluster, já que muitos exemplos dependem disso.

O DNS do cluster é um servidor DNS, além de outros servidores DNS em seu ambiente, que fornece registros DNS para serviços do Kubernetes.

Os contêineres iniciados pelo Kubernetes incluem automaticamente esse servidor DNS em suas pesquisas DNS.

### Web UI (Dashboard)
Dashboard é uma interface de usuário Web, de uso geral, para clusters do Kubernetes. Ele permite que os usuários gerenciem e solucionem problemas de aplicações em execução no cluster, bem como o próprio cluster.

### Monitoramento de recursos do contêiner
Monitoramento de recursos do contêiner registra métricas de série temporal genéricas sobre os contêineres em um banco de dados central e fornece uma interface de usuário para navegar por esses dados.

### Logging a nivel do cluster
Um mecanismo de logging a nível do cluster é responsável por guardar os logs dos contêineres em um armazenamento central de logs com um interface para navegação/pesquisa.

