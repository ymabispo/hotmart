# hotmart
Desafio DevOps

Prezados, utilizei como cloud a AmazonAWS e m�quinas com Linux CentOS, estou levando em considera��o que j� existe um security group default com as portas tcp 22, 80, 9998, 9999 liberadas para inbound e todo o tr�fego dentro do SG � livre. Se tratando de um ambiente sendo criado do zero apenas a m�quina de provisionamento com terraform e ansible seria criada manualmente enquanto todo o resto dos recursos seria criado automaticamente, de qualquer forma estou adicionando no ambiente o c�digo necess�rio para o provisionamento dessa m�quina (00-provisioning).

A pasta 00-provisioning cont�m os arquivos para criar os recursos necess�rios � execu��o do ambiente.
- Os arquivos t2micro-aws.tf e variables.tf s�o arquivos terraform que criaram as inst�ncias na aws.
- O arquivo ansible playbook.yml cria cluster docker utilizando swarm com 1 n� manager e 2 workers


A pasta 01-infrastructure cont�m os arquivos necess�rios para implantar a solu��o de LoadBalance e resolu��o de DNS chamada Traefik, a cada novo deploy de stacks no cluster o traefik reconhece e cria automaticamente uma rota para essa stack no LoadBalance conectando a rede externa com a rede interna como um proxy autom�tico, outras solu��es como NGINX podem resolver esse problema mas n�o de forma autom�tica e gr�tis. Sei que esse n�o � caso mas o traefik tamb�m prov� uma solu��o para aplica��es statefull com alta disponibilidade atrav�s de stick sessions mantendo a sess�o do usu�rio sempre em conex�o com o mesmo container. Mais informa��es https://docs.traefik.io/
- O arquivo base.yml cont�m as informa��es da stack referente �s configura��es do traefik
- O arquivo deploy.sh quando executado implanta a stack do traefik
- Uma rede externa chamada traefik-net deve ser criada independente da stack j� que as aplica��es utilizar�o essa rede e caso a stack do traefik tenha problemas as aplica��es n�o ser�o indisponibilizadas totalmente
- O console pode ser acessado atrav�s da porta 9998
- Este container ser� iniciado apenas no n� manager (sei que n�o � uma boa pr�tica iniciar containers no n� manager, entretando devido a infra reduzida acredito que os containers ficam melhor organizados dessa forma)


A pasta 02-static-html-test cont�m as aplica��es html est�ticas solicitadas para o teste. Levando em considera��o o pedido de simplicidade na solu��o durante o processo de build estou apenas copiando o site para dentro de uma imagem nginx. Solu��es de build podem ser muito mais complexas e podem ser orquestradas utilizando pipelines Jenkins em conjunto com MSBuild, Nuget, Ant, Maven e outros.
- Dentro das pastas das aplica��es os arquivos Dockerfile apenas "buildam" as aplica��es criando as imagens Docker.
- O arquivo base.yml cont�m as informa��es da stack referente �s configura��es das aplica��es utilizando a rede do traefik e o mesmo como proxy e resolvedor dns - Para acessar as aplica��es para chamar (dns do docker manager)/forty /phantom ou /stellar j� que est�o expostos nas portas 80 de seus containers.
- O arquivo deploy.sh quando executado implanta a stack das 3 aplica��es


A pasta 03-cluster-visualizer apenas inicia o container que possibilita a visualiza��o da infraestrutura e pode ser acessado atrav�s da porta 9999 ap�s sua stack ser implantada pelo arquivo deploy.sh




