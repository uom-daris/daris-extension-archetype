package ${package};

/**
 * Constants.
 * 
 * Initialize the constant values of doc namespace, role namespace, dictionary
 * namespace and service prefix.
 * 
 *
 */

public class Constants {

    //@formatter:off
	public static final String ORG_NAME_SHORT       = "${org_name_short}".toLowerCase();
	public static final String ORG_NAME_FULL        = "${org_name_full}";
	public static final String DOC_NAMESPACE        = ORG_NAME_SHORT + ".daris";
	public static final String DICTIONARY_NAMESPACE = ORG_NAME_SHORT + ".daris";
	public static final String ROLE_NAMESPACE       = ORG_NAME_SHORT + ".daris";
	public static final String SERVICE_PREFIX       = ORG_NAME_SHORT + ".daris";
	//@formatter:on

    public static String prependDocNamespace(String doc) {
        return DOC_NAMESPACE + ":" + doc;
    }

    public static String prependDictionaryNamespace(String dictionary) {
        return DICTIONARY_NAMESPACE + ":" + dictionary;
    }

    public static String prependRoleNamespace(String role) {
        return ROLE_NAMESPACE + ":" + role;
    }

    private Constants() {

    }

}
