package daris.plugin;

import java.util.Collection;
import java.util.Vector;

import arc.mf.plugin.PluginService;
import arc.mf.plugin.ConfigurationResolver;
//@formatter: on
//TODO: import ${package}.services.*;
import daris.plugin.services.*;

// @formatter: off

/**
 * The plugin module class.
 * 
 * All your services should be registered in initialize() method.
 * 
 * @author wliu5
 *
 */
public class DarisPluginModule implements arc.mf.plugin.PluginModule {

    private Collection<PluginService> _services = null;

    @Override
    public String description() {

        return Constants.ORG_NAME_SHORT.toUpperCase() + " Plugin Module.";
    }

    @Override
    public void initialize(ConfigurationResolver config) throws Throwable {

        _services = new Vector<PluginService>();
        _services.add(new SvcSample());
        // TODO: register your services here
    }

    @Override
    public void shutdown(ConfigurationResolver config) throws Throwable {

    }

    @Override
    public String vendor() {

        return Constants.ORG_NAME_FULL;
    }

    @Override
    public String version() {

        return "1.0";
    }

    @Override
    public Collection<PluginService> services() {

        return _services;
    }

}