package it.immersea.libdivecomputerplugin;

import com.getcapacitor.*;

@CapacitorPlugin(name = "libdcPlugin")
public class LibDiveComputerPlugin extends Plugin {
  @PluginMethod
  public void createContext(PluginCall call) {
    long ptr = LibDiveComputerPluginBridge.nativeCreateContext();
    JSObject res = new JSObject();
    res.put("ctxPtr", ptr);
    call.resolve(res);
  }
}