## Customize Makefile settings for bryo
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

imports/oba_import.owl: mirror/oba.owl imports/oba_terms_combined.txt
	@if [ $(IMP) = true ]; then $(ROBOT) extract -i $< -T imports/oba_terms_combined.txt --force true --method BOT \
		remove --term UBERON:0005156 --axioms EquivalentClasses \
		query --update ../sparql/inject-subset-declaration.ru \
		annotate --ontology-iri $(ONTBASE)/$@ --version-iri $(ONTBASE)/releases/$(TODAY)/$@ --output $@.tmp.owl && mv $@.tmp.owl $@; fi
.PRECIOUS: imports/oba_import.owl
