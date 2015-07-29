proc create_doc_type_pssd_subject { ns } {

    asset.doc.type.update \
        :create true :type ${ns}:pssd.subject \
        :description "Document type for project-based subject" \
        :label "Subject" \
        :definition < \
            :element -name type  -min-occurs 1 -max-occurs 1 \
                -type enumeration -enumerated-values animal,non-animal \
                -index true -case-sensitive false < \
                :description "Animal or non-animal Subject" > \
            :element -name control -min-occurs 0 -max-occurs 1 -type boolean -index true  < \
                :description "Subject is a member of a control group" > \
        >

}

proc create_doc_type_pssd_identity { ns } {

    asset.doc.type.update \
        :create true :type ${ns}:pssd.identity \
        :description "Document type for subject identity" \
        :label "External Subject Identifier" \
        :definition < \
            :element -name id -min-occurs 0 -max-occurs infinity  -type string -index true  < \
                :description "Unique identifier for the subject allocated by some other authority for cross-referencing" \
                :attribute -name type -type enumeration -min-occurs 0 < \
                    :restriction -base enumeration < \
                        :value RCH \
                        :value HFIAS \
                        :value aMRIF \
                        :value INF \
                        :value VIBES \
                        :value "Royal Hobart Hospital" \
                        :value Other \
                    > \
                > \
            > \
        >

}

proc create_doc_type_pssd_human_subject { ns } {

    asset.doc.type.update \
        :create true :type ${ns}:pssd.human.subject \
        :description "Document type for a Human subject" \
        :label "Human Subject" \
        :definition < \
            :element -name handedness -min-occurs 0 -max-occurs 1 -type enumeration \
                -enumerated-values left,right,ambidextrous,unknown -index true \
                -case-sensitive false < :description "Handedness of the subject" > \
            :element -name height  -min-occurs 0 -max-occurs 1 -type float -min 0.0 -index true  < \
                    :attribute -type enumeration -name units -enumerated-values "m" -min-occurs 0  \
                    :description "Height of subject (m)" \
            > \
            :element -name smoking  -min-occurs 0 -max-occurs 1 -type enumeration \
                -enumerated-values never,ex,social,current,unknown -index true -case-sensitive false < \
                :description "Smoking habits." \
            > \
            :element -name alcohol -min-occurs 0 -max-occurs 1  -type float -min 0.0 -index true  < \
                :attribute -type enumeration -name units -enumerated-values "unit/day" -min-occurs 0  \
                :description "Average consumption of alcohol (unit/day). One unit = 10ml or 8g" \
            > \
        >

}

proc create_doc_type_pssd_human_identity { ns } {

    asset.doc.type.update \
        :create true \
        :type ${ns}:pssd.human.identity \
        :label "Human Identification" \
        :description "Document type for human subject identity" \
        :definition < \
            :element -name prefix -type string -min-occurs 0 -max-occurs 1 -length 20 -label "Prefix" \
            :element -name first  -type string -min-occurs 1 -max-occurs 1 -length 40 -label "First" \
            :element -name middle -type string -min-occurs 0 -max-occurs 1 -length 100 -label "Middle" < \
                :description "If there are several 'middle' names then put them in this field" \
            > \
            :element -name last   -type string -min-occurs 1 -max-occurs 1 -length 40 -label "Last" \
            :element -name suffix -type string -min-occurs 0 -max-occurs 1 -length 20 -label "Suffix" \
        >

}

proc create_doc_type_pssd_animal_subject { ns } {

    asset.doc.type.update \
        :create true :type ${ns}:pssd.animal.subject \
        :description "Document type for an animal (Humans included) subject" \
        :label "Subject Basics" \
        :definition < \
            :element -name species -min-occurs 0 -max-occurs 1 \
                -type enumeration  -dictionary $ns:pssd.animal.species \
                -index true  -case-sensitive false < :description "Species type of the animal" >  \
            :element -name gender -min-occurs 0 -max-occurs 1 \
                -type enumeration -enumerated-values male,female,other,unknown \
                -index true  -case-sensitive false < :description "Gender of the subject" > \
            :element -name birthDate -min-occurs 0 -max-occurs 1 \
                -type date -index true  < :description "Birth date of the subject" > \
            :element -name deathDate -min-occurs 0 -max-occurs 1 \
                -type date -index true < :description "Death date of the subject" > \
            :element -name age-at-death  -min-occurs 0 -max-occurs 1 -type integer -min 0 -index true  < \
                :attribute -type enumeration -name units -enumerated-values "days,weeks" -min-occurs 0  \
                :description "Age of subject (days or weeks) at time of death (intended for non-human subjects)." \
            > \
            :element -name weight-at-death  -min-occurs 0 -max-occurs 1 -type float -min 0.0 -index true  < \
                :attribute -type enumeration -name units -enumerated-values "g,Kg" -min-occurs 0  \
                :description "Weight of subject (g or Kg) at time of death (intended for non-human subjects." \
            > \
        >

}


proc create_doc_type_pssd_animal_disease { ns } {

    asset.doc.type.update \
        :create true :type ${ns}:pssd.animal.disease  \
        :description "Document type for animal subject (Humans included) disease" \
        :label "Subject disease" \
        :definition < \
            :element -name disease -min-occurs 0 -max-occurs 1 -index true \
                -type enumeration  -dictionary $ns:pssd.subject.pathology \
                -case-sensitive false < :description "Disease pathology of the subject" > \
            :element -name disease-state -type document -index true -min-occurs 0 -max-occurs infinity < \
                :description "Describe the state of the disease in the subject with time" > < \
                :element -name state -type enumeration -min-occurs 0 -max-occurs 1 -index true \
                    -enumerated-values pre-symptomatic,symptomatic,asymptomatic < \
                    :description "State of the disease at the specified time" > \
                :element -name time -type document -min-occurs 0 -max-occurs 1 -index true <\
                    :element -name date -type date -min-occurs 0 -max-occurs 1 -index true < \
                        :description "Date when current disease state was set" > \
                    :element -name time-point -type integer -min-occurs 0 -max-occurs 1 -index true < \
                        :description "Time-point (0 is baseline) when current disease state was set" > \
                > \
            >\
        >\

}
    
    
proc create_doc_type_pssd_animal_genetics { ns } {

    asset.doc.type.update \
        :create true :type ${ns}:pssd.animal.genetics \
        :description "Document type for basic animal (Humans included) genetic information" \
        :label "Animal genetics" \
        :definition < \
            :element -name strain -type document -index true -min-occurs 0 -max-occurs infinity < \
                :description "The genetic strain of the animal" \
                :element -name name -type enumeration  -dictionary :ns:pssd.animal.strains \
                    -index true -min-occurs 0 -max-occurs 1 < \
                    :description "The standard name of the genetic strain" \
                > \
                :element -name fraction -type float -min 0.0 -max 1.0 \
                    -index true -min-occurs 0 -max-occurs 1 < \
                    :description "The fraction that this strain contributes" \
                > \
            > \
        >

}

proc create_core_doc_types { ns } {

    create_doc_type_pssd_subject $ns
    create_doc_type_pssd_identity $ns
    create_doc_type_pssd_human_subject $ns
    create_doc_type_pssd_human_identity $ns
    create_doc_type_pssd_animal_subject $ns
    create_doc_type_pssd_animal_disease $ns
}

proc destroy_core_doc_types { ns } {

    destroy_doc_type ${ns}:pssd.subject
    destroy_doc_type ${ns}:pssd.identity
    destroy_doc_type ${ns}:pssd.human.subject
    destroy_doc_type ${ns}:pssd.human.identity
    destroy_doc_type ${ns}:pssd.animal.subject
    destroy_doc_type ${ns}:pssd.animal.disease
}
