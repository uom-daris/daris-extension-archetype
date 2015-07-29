#
# Creates dictionary: ${ns}:pssd.animal.species
#
proc create_dict_pssd_animal_species { ns } {
    create_dictionary ${ns} "pssd.animal.species" "Dictionary for animal species" { \
        { human     "" } { baboon    "" } { cat       "" } { guineapig "" } \
        { marmoset  "" } { mouse     "" } { monkey    "" } { pig       "" } \
        { rat       "" } { rabbit    "" } { sheep     "" } }
}

#
# Creates dictionary: ${ns}:pssd.subject.pathology
#
proc create_dict_pssd_subject_pathology { ns } {
    create_dictionary ${ns} "pssd.subject.pathology" "Disease pathologies for subjects" { \
        { "Alzheimer's Disease" "" } \
        { "Experimental Autoimmune Encephalomyelitis (EAE)" "" } \
        { "Epilepsy" "" } \
        { "Freidrich Ataxia" "" } \
        { "Huntington's Disease" "" } \
        { "Multiple Sclerosis" "" } \
        { "Motor Neuron" "" } \
        { "Obesity" "" } \
        { "Optic Neuritis" "" } \
        { "Parkinson's Disease" "" } \
        { "Stroke" "" } \
        { "Other" "" } \
        { "Chronic Pain" "" } \
        { "None" "" } }
}

#
# Creates dictionary: ${ns}:pssd.animal.strains
#
proc create_dict_pssd_animal_strains { ns } {
    create_dictionary ${ns} "pssd.animal.strains" "Genetic strains of animals" { \
	    { "C57Black" "Mouse strain" } \
	    { "129" "Mouse strain" } \
        { "BALB/C" "Mouse strain" } }
}

#
# Creates dictionary: ${ns}:pssd.animal.genes
#
proc create_dict_pssd_animal_genes { ns } {
    create_dictionary ${ns} "pssd.animal.genes" "Standard animal gene names" { \
        { "Leukemic Inhibitory Factor (LIF)" } \
        { "Ciliary Neurotropic Factor (CNTF)" } }
}

#
# Creates dictionary: ${ns}:PET.tracer
#
proc create_dict_PET_tracers { ns } {
    create_dictionary ${ns} "PET.tracer" "Standard PET imaging tracers" { \
        { "11C-PIB" "Pittsburgh Compound B" } \
        { "18F-FDG" "18F-2-fluoro-deoxy-D-glucose" } }
}

#
# Creates or update all dictionaries
#
proc create_update_dicts { ns } {
	create_dict_pssd_animal_species $ns
	create_dict_pssd_subject_pathology $ns
	create_dict_pssd_animal_strains $ns
	create_dict_pssd_animal_genes $ns
	create_dict_PET_tracers $ns
}

#
# Destroy all dictionaries
#
proc destroy_dicts { ns } {
    dictionary.destroy :name ${ns}:pssd.animal.species
    dictionary.destroy :name ${ns}:pssd.subject.pathology
    dictionary.destroy :name ${ns}:pssd.animal.strains
    dictionary.destroy :name ${ns}:pssd.animal.genes
    dictionary.destroy :name ${ns}.PET.tracer
}

