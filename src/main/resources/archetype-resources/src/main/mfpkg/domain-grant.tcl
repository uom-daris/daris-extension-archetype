##############################################################################
# This service will grant certain services the rights to grant/revoke roles  #
# within the specified authentication domain.  In this way, end-users can    #
# grant/revoke roles for other users in a constrained way.  This is necessary#
# because the MF permissions model requires domain permissions for the       #
# underlying services.                                                       #
#                                                                            #
# Any new domain you create you must do this if you want users to be able to #
# grant/revoke roles.                                                        #
##############################################################################

proc grant_auth_domain { auth_domain } {
	om.pssd.domain.grant :domain ${auth_domain}
}
