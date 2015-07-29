##############################################################################
#                                                                            #
# This script creates addition (to the basic doc types defined in            #
# daris-core-services) specific document types for meta-data to be attached  #
# to daris objects for the HFI's EAE project.                                #
#                                                                            #
##############################################################################

##############################################################################
# Perfusion
##############################################################################
proc create_doc_type_pssd_EAE_perfusion { ns } {
       asset.doc.type.update \
           :create true :type ${ns}:pssd.EAE.perfusion \
           :description "Document type for perfusion of mouse brains in EAE experiment" \
           :definition < \
              :element -name agent  -type document -min-occurs 0 -max-occurs infinity  < \
                :description "Describes a perfusion agent" \
                :element -name name  -type enumeration  \
                         -enumerated-values "paraformaldehyde,gluteraldehyde,formalin,osmium tetraoxide,potassium ferricyanide" \
                         -index true -min-occurs 0 -max-occurs 1 < \
                   :description "Agent name" \
                 > \
                :element -name concentration -type float -min 0.0 -max 100.0 \
                         -index true -min-occurs 0 -max-occurs 1 < \
                   :attribute -type enumeration -name units -default "%" -enumerated-values "%" -min-occurs 0 \
                   :description "Concentration (%) of agent in buffer" \
                > \
              > \
              :element -name buffer  -type document -min-occurs 0 -max-occurs 1 < \
                :description "Describes the perfusion buffer" \
                :element -name name  -type enumeration  \
                         -enumerated-values "sodium cacodylate,phosphate buffered saline,water" \
                         -index true -min-occurs 0 -max-occurs 1 < \
                   :description "Buffer  name" \
                 > \
                :element -name concentration -type float -min 0.0 -max 100.0 \
                         -index true -min-occurs 0 -max-occurs 1 < \
                   :attribute -type enumeration -name units -enumerated-values "M" -default "M" -min-occurs 0 \
                   :description "Concentration (M) of buffer in water solution" \
                > \
              > \
              :element -name duration -type float -min 0.0 \
                       -index true -min-occurs 0 -max-occurs 1 < \
                 :attribute -type enumeration -name units -enumerated-values "hr" -default "hr" -min-occurs 0 \
                 :description "Duration of process (hours)" \
              > \
              :element -name temperature -type float -min 0.0 \
                       -index true -min-occurs 0 -max-occurs 1 < \
                 :attribute -type enumeration -name units -enumerated-values "C,F" -default "C" -min-occurs 0 \
                 :description "Temperature of solution" \
              > \
              :element -name delivery -type enumeration \
                       -index true -min-occurs 0 -max-occurs 1 \
                 -enumerated-values "aorta,cardiac puncture" < \
                 :description "Delivery method of perfusion solution"  \
              > \
           >
}

proc destroy_doc_type_pssd_EAE_perfusion  { ns force } {

    if { $force != "true" && $force != "false" } {
        set force "false"
    }
    if { [xvalue exists [asset.doc.type.exists :type ${ns}:pssd.EAE.perfusion]] == "true" } {
        asset.doc.type.destroy :type ${ns}:pssd.EAE.perfusion :force $force
    }
}

##############################################################################
# stain
##############################################################################
proc create_doc_type_pssd_EAE_stain { ns } {
       asset.doc.type.update \
           :create true :type ${ns}:pssd.EAE.stain \
           :description "Document type for staining of tissue slices in  EAE experiment" \
           :definition < \
              :element -name agent  -type document -min-occurs 0 -max-occurs infinity  < \
                :description "Describes a staining  agent" \
                :element -name name  -type enumeration  \
                         -enumerated-values "methylene blue" \
                         -index true -min-occurs 0 -max-occurs 1 < \
                   :description "Staining agent name" \
                 > \
              > \
           >
}

proc destroy_doc_type_pssd_EAE_stain  { ns force } {
    if { $force != "true" && $force != "false" } {
        set force "false"
    }
    if { [xvalue exists [asset.doc.type.exists :type ${ns}:pssd.EAE.stain]] == "true" } {
        asset.doc.type.destroy :type ${ns}:pssd.EAE.stain :force $force
    }
}

##############################################################################
# optic nerve removal
##############################################################################
proc create_doc_type_pssd_EAE_optic_nerve_removal  { ns } {
        asset.doc.type.update \
           :create true :type ${ns}:pssd.EAE.optic-nerve.removal  \
           :description "Document type for EAE Method describing how the optic nerve is removed" \
           :definition < \
              :element -name method  -type enumeration  \
                         -enumerated-values "retro-chiasmal trans-section" \
                         -index true -min-occurs 1 -max-occurs 1 < \
                 :description "Method of removing optic nerve" \
              >\
              :element -name which -type enumeration  \
                       -enumerated-values "left,right" \
                       -index true -min-occurs 0 -max-occurs 2 < \
                 :description "Which nerve was removed" \
              >\
           >
}


proc destroy_doc_type_pssd_EAE_optic_nerve_removal { ns force } {
    if { $force != "true" && $force != "false" } {
        set force "false"
    }
    if { [xvalue exists [asset.doc.type.exists :type ${ns}:pssd.EAE.optic-nerve.removal]] == "true" } {
        asset.doc.type.destroy :type ${ns}:pssd.EAE.optic-nerve.removal :force $force
    }
}


##############################################################################
# optic nerve section
##############################################################################
proc create_doc_type_pssd_EAE_optic_nerve_section  { ns } {
    asset.doc.type.update \
        :create true :type ${ns}:pssd.EAE.optic-nerve.section   \
        :description "Document type for EAE Method describing how the optic nerve is sectioned " \
        :definition < \
            :element -name thickness  -type float -min 0.0 \
                -index true -min-occurs 0 -max-occurs 1 < \
                :attribute -type enumeration -name units -enumerated-values "micron" -default "micron" -min-occurs 0 \
                :description "Thickness of slice in micron (micrometres)" \
            > \
        >
}

proc destroy_doc_type_pssd_EAE_optic_nerve_section  { ns force } {
    if { $force != "true" && $force != "false" } {
        set force "false"
    }
    if { [xvalue exists [asset.doc.type.exists :type ${ns}:pssd.EAE.optic-nerve.section]] == "true" } {
        asset.doc.type.destroy :type ${ns}:pssd.EAE.optic-nerve.section :force $force
    }
}

##############################################################################
# microscopy
##############################################################################
proc create_doc_type_pssd_EAE_microscopy  { ns } {
    asset.doc.type.update \
        :create true :type ${ns}:pssd.EAE.microscopy   \
        :description "Document type for EAE Method describing microscopy acquisition" \
        :definition < \
            :element -name magnification -type integer -min 1 \
                -index true -min-occurs 0 -max-occurs 1 < :description "Magnification of imaging" > \
        >
}


proc destroy_doc_type_pssd_EAE_microscopy  { ns force } {
    if { $force != "true" && $force != "false" } {
        set force "false"
    }
    if { [xvalue exists [asset.doc.type.exists :type ${ns}:pssd.EAE.microscopy]] == "true" } {
        asset.doc.type.destroy :type ${ns}:pssd.EAE.microscopy :force $force
    }
}


##############################################################################
# creates EAE doc types
##############################################################################
proc create_EAE_doc_types { ns } {
    create_doc_type_pssd_EAE_perfusion $ns
    create_doc_type_pssd_EAE_optic_nerve_removal $ns
    create_doc_type_pssd_EAE_optic_nerve_section $ns
    create_doc_type_pssd_EAE_stain $ns
    create_doc_type_pssd_EAE_microscopy $ns
}

##############################################################################
# destroys EAE doc types
##############################################################################
proc destroy_EAE_doc_types { ns } {
    set force "false"
    destroy_doc_type_pssd_EAE_perfusion $ns $force
    destroy_doc_type_pssd_EAE_optic_nerve_removal $ns $force
    destroy_doc_type_pssd_EAE_optic_nerve_section $ns $force
    destroy_doc_type_pssd_EAE_stain  $ns $force
    destroy_doc_type_pssd_EAE_microscopy  $ns $force
}

