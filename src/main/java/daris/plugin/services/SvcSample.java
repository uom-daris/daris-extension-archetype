package daris.plugin.services;

// @formatter:off
// TODO: import ${package}.Constants;
import daris.plugin.Constants;
import arc.mf.plugin.*;
import arc.mf.plugin.dtype.*;
import arc.xml.*;
// @formatter:on

/**
 * A sample service. It simply calls om.pssd.object.describe service by passing
 * the cid argument to it.
 * 
 * @author wliu5
 *
 */
public class SvcSample extends PluginService {

    private Interface _defn;

    public SvcSample() {
        _defn = new Interface();
        _defn.add(new Interface.Element("cid", CiteableIdType.DEFAULT,
                "The citeable identifier of the object.", 1, 1));
    }

    public String name() {
        return Constants.SERVICE_PREFIX + ".sample";
    }

    public String description() {
        return "Sample service";
    }

    public Interface definition() {
        return _defn;
    }

    public Access access() {
        return ACCESS_MODIFY;
    }

    public void execute(XmlDoc.Element args, Inputs in, Outputs out, XmlWriter w)
            throws Throwable {

        /*
         * get the cid argument value
         */
        String id = args.value("cid");
        /*
         * build the args for om.pssd.object.describe service.
         */
        XmlDocMaker dm = new XmlDocMaker("args");
        dm.add("id", id);
        /*
         * call om.pssd.object.describe service.
         */
        XmlDoc.Element r = executor().execute("om.pssd.object.describe",
                dm.root());
        /*
         * return the result.
         */
        w.add(r.element("object"));
    }

}
