# hotmart
Desafio DevOps

A pasta 00-provisioning contém os arquivos para criar os recursos necessários à execução do ambiente.
- Os arquivos t2micro-aws.tf e variables.tf são arquivos terraform que criaram as instâncias na aws.
- O arquivo ansible playbook.yml cria cluster docker utilizando swarm com 1 nó manager e 2 workers


A pasta 01-infrastructure contém os arquivos necessários para implantar a solução de LoadBalance e resolução de DNS chamada Traefik, a cada novo deploy de stacks no cluster o traefik reconhece e cria automaticamente uma rota para essa stack no LoadBalance conectando a rede externa com a rede interna como um proxy automático, sei que esse não é caso mas o traefik também provê uma solução para aplicações statefull com alta disponibilidade através de stick sessions. Mais informações https://docs.traefik.io/
- O arquivo base.yml contém as informações da stack referente às configurações do traefik
- O arquivo deploy.sh quando executado implanta a stack do traefik
- Uma rede externa chamada traefik-net deve ser criada independente da stack já que as aplicações utilizarão essa rede e caso a stack do traefik tenha problemas as aplicações não serão indisponibilizadas totalmente
- O console pode ser acessado através da porta 9998
- Este container será iniciado apenas no nó manager (sei que não é uma boa prática iniciar containers no nó manager, entretando devido a infra reduzida acredito que os containers ficam melhor organizados dessa forma)


A pasta 02-static-html-test contém as aplicações html estáticas solicitadas para o teste. Levando em consideração o pedido de simplicidade na solução durante o processo de build estou apenas copiando o site para dentro de uma imagem nginx. Soluções de build podem ser muito mais complexas e podem ser orquestradas utilizando pipelines Jenkins em conjunto com MSBuild, Nuget, Ant, Maven e outros.
- Dentro das pastas das aplicações os arquivos Dockerfile apenas "buildam" as aplicações criando as imagens.
- O arquivo base.yml contém as informações da stack referente às configurações das aplicações utilizando a rede do traefik e o mesmo como proxy e resolvedor dns - Para acessar as aplicações para chamar /forty /phantom ou /stellar já que estão expostos nas portas 80 de seus containers.
- O arquivo deploy.sh quando executado implanta a stack das 3 aplicações


A pasta 03-cluster-visualizer apenas inicia o container que possibilita a visualização da infraestrutura e pode ser acessado através da porta 9999 após sua stack ser implantada pelo arquivo deploy.sh




