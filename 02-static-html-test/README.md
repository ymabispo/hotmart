# Cenário de teste
## Traefik + 3 Aplicativos simulados
Foram colocados 3 templates HTML estáticos em uma imagem nginx simulando 3 aplicativos para serem colocados em uma mesma stack e rede com o traefik.
O traefik identificou as aplicações e acrescentou automaticamente os backends com os seguintes labels sendo aplicados:
> labels:  
>  - "traefik.backend=**serviceName**"  
>  - "traefik.frontend.rule=PathPrefixStrip:**/path**"  
>  - "traefik.port=**portaInternaDoContainer**"  
>  - "traefik.enable=true"  

**Obs:** Devem ser aplicados na sessão **deploy:** quando num stackfile yml.