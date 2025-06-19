package it.immersea.libdivecomputerplugin;

public class LibDiveComputerPluginBridge {
  static { System.loadLibrary("libdivecomputerplugin"); }
  public static native long nativeCreateContext();
}