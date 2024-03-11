Self supervised youtube:
<https://www.youtube.com/watch?v=iGJ1XSkCyU0>

# IBD imflamm bowel diseasy

## Alex: kan vi predikte direkte på billederne

MES score - sygdomsgrad 0-3
læger er uenige om samme billeder, giver forskellige score på samme billeder

## Marcus

hysterlogi - cellebilleder
 informations score i cellerne
 anden måde at måle på
 kan vi predicte direkte på cellerne?

## Kandidatstud: ultralyd

dårlige kvalitet men mindre invasiv

spiller sammen, nogle ser det store billede, nogle ser det lokale billede

* masked siamese networks
* ViT
  * vision tranformers
* self supervised learning:
  * contrastive learning before (pre-train)
* Second training with limited annotations
* Kræver 50% mindre data via denne metode

alt er ViT:
Hvis vi pre trainer på unsupervised, får vi bedre results?
———
conda env, conda freeze,

brug fastai timm:
    'vit_base_patch16_xp_224.untrained': _cfg(url=''),
måske uden xp eller small

6196 6665
———

# DAGBOG

## uge1

### 1. start med masked autoencoder

 træn classifier m baseline
hvilken accuracy?
16. feb fredag:
 har trænet hele natten. Ikke rigtig konvertgeret men self heller ikke ås mange epochs (den ville ikke afsløre hvor mange,  men mindre end 20. Ligner ikke at loss blev bedre.)
 Har lige nu ændret transforms til det fra timms hjemmeside (<https://huggingface.co/docs/timm/quickstart>).
 Skal til bachelor vejlednin gmed bjørn snart. Så må vi se. Lige nu er acc/f1!=0.31. Fordi den kun kan finde ud af 1 klasse.

efter vejledning:
implemented:
weighted random sampler (skal kunne forsvare til eksamen)
prodigy optimizer (samme^)

mangler: pytorch lightning

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

2. masked auto encoder med præ træning
3. flere og flere præ træningsmetoder
    1.
