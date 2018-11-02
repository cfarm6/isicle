from os.path import *

# snakemake configuration
include: 'mobility.snakefile'

SMI, = glob_wildcards(join('input', '{id}.smi'))
INCHI, = glob_wildcards(join('input', '{id}.inchi'))
IDS = SMI + INCHI

IDS.sort()
IDS = IDS[config['start']:config['stop']]


rule all:
    input:
        expand(join('output', 'mobility', 'mobcal', 'calibrated_ccs', '{id}_{adduct}.tsv'),
               id=IDS, adduct=config['adducts'])
