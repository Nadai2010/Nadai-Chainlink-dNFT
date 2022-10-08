# Nadai Tutorial NFT Dinámicos con automatización de Chainlink

Puede encontrar los Workshop de [Chainlink Aquí](https://www.youtube.com/watch?v=1l6iuhn65HM) en formato `Video` y en documentos [Oficiales Chainlink](https://blog.chain.link/what-is-a-dynamic-nft/).

También puede revisar estos link de utilidad, alguno de ellos veremos más en profundidad:

* [Metadata Open Sea](https://docs.opensea.io/docs/metadata-standards)
* [Chainlink Keepers](https://automation.chain.link/) ahora se llama Chainlink Automation.

Para obtener más información, visite las Notas de la versión de [Chainlink Automation](https://docs.chain.link/docs/chainlink-automation/automation-release-notes/).
 
## Descripición General de los NadaiMon

Este repositorio contiene todos los archivos para poder replicar el workshop de principio a fin. Encotraremos un Smart Contract `NadaiMondNDT.sol` que contiene los ajustes necesarios para el lanzamiento de prueba de una colleción de 11 `NadaiMon`, estas criaturas son una especie de Pokemon que se alimenta de Token Link, así que necesitaremos añadir nuestro smart a [Chainlink Keepers](https://automation.chain.link/) el que se alimenta del faucet conseguido [aquí de Link](https://faucets.chain.link/).

## Preparación Wallet

Debera de tener una wallet con red de prueba añadida como `Goerli`. Puede seguir el link del  faucet [Link](https://faucets.chain.link/) para conseguir su goEth de pruebas y su Link (Registre con Twitter para conseguir 20 LINK).

## Configuración de archivos en Pinata

Aqui nos preparemos para subir las carpetas de imagenes que usaremos para nuestros NFT dinámicos, así que puede usar el Tutorial aquí descrito para dar vida a sus NadaiMon.

* También dispone de las `imagenes` y `Metadata` del workshop original de autos.
* También dispone de las `imagenes` y `Metadata` de un testeo de Supergirl.

Ahora que ya tenemos las imagenes las subiremos a un servicio de IPFS, teniendo nuestras imagenes y metadatos listas para nuestra creación de dNFT.

### Primer Paso

Accedemos a [Pinata](https://www.pinata.cloud/) nos registramos y hacemos login. Una vez dentro
de la app, (Sino lo les entra acceder desde [AQUI](https://app.pinata.cloud/)).

![Graph](/contracts/Imagenes/Tutorial/dnft1.png)

Seleccionamos la carpeta completa que queremos subir y se nos creara una carpeta con su CID.
Accedemos a ella y veremos que está todos nuestras imagenes, en las que tenemos que ir cogiendo su `CID` pero al meterlo en carpeta será el mismo y de una forma mas ordenada, vamos a las fotos y lo veremos mejor.

![Graph](/contracts/Imagenes/Tutorial/dnft2.png)

![Graph](/contracts/Imagenes/Tutorial/dnft3.png)

Como vemos nuestro CID aquí seran los mismos en nuestros NadaiMon cambiando el ultimo `/NadaiMon.png`, por `1`, `2`, así hasta completar las 11 de esta edición.
NOTA: Si se añaden sin carpeta quedarian todos con CID distintos.

-------

## Configuración Metadata

En este repositorio encontrará los Metadata que usaremos para nuestros NadaiMon. Los metadatos son datos que podran identificar en opensea sus atributos, nombre, valores y otros datos que queremos darle. En este Workshop haremos que los Metadatos que vayamos entregando sean de 10 imagenes en `png` de criaturas que iran cambiando su Potencia, Nombre, Tipo y otros atributos. Una última figura de todos juntos.

Puede consultar [Standar](https://docs.opensea.io/docs/metadata-standards) y modificar sus ajustes con cualquier editor. En nuestro caso usamos Vscode.

Si ha 

## Chainlink Automation

Link - https://automation.chain.link/

## Metadata Standars Opensea

https://docs.opensea.io/docs/metadata-standards