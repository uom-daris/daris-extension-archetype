##############################################################################
#                                                                            #
# Usage:                                                                     #
#     package.install :arg -name <arg-name> <value>                          #
#                                                                            #
# Arguments:                                                                 #
#     studyTypes - If set to false, does not add the pssd Study type         #
#                  definitions. Defaults to true.                            #
#          model - Set to false to not make any changes to the object model  #
#                  such as what meta-data are registered with the data model.#
#                  Defaults to true.                                         #
#         fillIn - Set to true to fill in CID space for Methods when         #
#                  creating.                                                 #
#         action - If Method pre-exists, action = 0 (do nothing),            #
#                  1 (replace), 2 (create new)                               #
#                                                                            #
##############################################################################
# include the utility functions in utils.tcl.
source utils.tcl

# organization short name
set ORG            [string tolower "${org_name_short}"]
# java source package
set PKG            "${package}"
# maven artifact id
set ARTIFACT_ID    "${artifactId}"

set DOC_NS         "${ORG}.daris"
set DICT_NS        "${ORG}.daris"
set ROLE_NS        "${ORG}.daris"
set SERVICE_PREFIX "${ORG}.daris"
set AUTH_DOMAIN    "${ORG}"

#============================================================================
# Create dictionaries. You need to modify dictionaries.tcl to create 
# your own dictionaries.
#
# Note: it is created first because services may, when being reloaded, 
#       instantiate classes which specify dictionaries
#============================================================================
source dictionaries.tcl
create_update_dicts ${DICT_NS}

#=============================================================================
# Create document types in own doc type namespace
#=============================================================================
if { [xvalue exists [asset.doc.namespace.exists :namespace ${DOC_NS}]] == "false" } {
    asset.doc.namespace.create :namespace ${DOC_NS}
} 
source doc-types-core.tcl
create_core_doc_types ${DOC_NS}

source doc-types-generic.tcl
create_generic_doc_types ${DOC_NS}

# Leave the EAE here as a nice complex example
source doc-types-EAE.tcl
create_EAE_doc_types ${DOC_NS}

#============================================================================
# Add our Study Types. The command-line arguments allows you to choose to
# not add our study types, so other sites can fully define their own.
#============================================================================
set createStudyTypes 1
if { [info exists studyTypes ] } {
    if { ${studyTypes} == "false" } {
        set createStudyTypes 0
    }
}
if { ${createStudyTypes} == 1 } {
   source study-types.tcl
   create_study_types
}

#=============================================================================
# Create methods
#=============================================================================
# Method fill-in argument
set fillInMethods 1
if { [info exists fillIn ] } {
    if { $fillIn == "false" } {
        set fillInMethods 0
    }
}

# Method action argument
set methodAction 0
if { [info exists action ] } {
    set methodAction $action
}

source method-human-mri.tcl
create_method_human_mri ${DOC_NS} $methodAction $fillInMethods

source method-animal-mri.tcl
create_method_animal_mri ${DOC_NS} $methodAction $fillInMethods

source method-multi-mode.tcl
create_method_multi_mode ${DOC_NS} $methodAction $fillInMethods

# Leave the EAE method here as it is a nice example but don't actually make it
#source method-EAE.tcl
#create_method_EAE ${DOC_NS} $methodAction

# ============================================================================
# Add plugin module
# ============================================================================
set plugin_label      [string toupper PACKAGE_$package]
set plugin_namespace  mflux/plugins
set plugin_zip        "${ARTIFACT_ID}-plugin.zip"
set plugin_jar        "${ARTIFACT_ID}-plugin.jar"
set module_class      "${PKG}.DarisPluginModule"
add_plugin_module ${plugin_namespace} ${plugin_zip} ${plugin_jar} ${module_class} ${plugin_label}

#=============================================================================
# Set up roles & permissions
#=============================================================================
source role-permissions.tcl
set_role_permissions ${DOC_NS} ${ROLE_NS} ${SERVICE_PREFIX}

#=============================================================================
# Register a Project role-member exemplar
#=============================================================================
source role-members-register.tcl
register_role_member ${ROLE_NS}

#=============================================================================
# Register metadata with the data model
#=============================================================================
set updateModel 1
if { [info exists model] } {
    if { $model == "false" } {
        set updateModel 0
    }
}
if { $updateModel == 1 } {
   source metadata-register.tcl
   register_metadata ${DOC_NS}
}

#=============================================================================
# Set up a authentication domain (and create a sample user)
#=============================================================================
if { [xvalue exists [authentication.domain.exists :domain ${AUTH_DOMAIN}]] == "false" } {
    authentication.domain.create :domain ${AUTH_DOMAIN}
}

set create_test_user 0
if { ${create_test_user} > 0 } {
    set test_user "test-user"
    if { [xvalue exists [user.exists :domain ${AUTH_DOMAIN} :user ${test_user} ]] == "false" } {
        om.pssd.user.create :domain ${AUTH_DOMAIN} :user ${test_user} :name -type first Test :name -type last User :password Test_me0 :project-creator true :role ${ROLE_NS}:pssd.model.user
    }
}

## (Optionally) grant authentication domain so that all the users in the domain will be able to grant roles/perms
#source domain-grant.tcl
#grant_auth_domain ${AUTH_DOMAIN}
