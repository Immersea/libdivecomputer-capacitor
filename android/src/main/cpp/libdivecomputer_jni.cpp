#include <jni.h>
#include <libdivecomputer/context.h>

extern "C"
JNIEXPORT jlong JNICALL
Java_it_immersea_libdivecomputerplugin_LibDiveComputerPluginBridge_nativeCreateContext(JNIEnv*, jclass) {
  dc_context_t *ctx = NULL;
  dc_context_new(&ctx);  // o altra funzione di inizializzazione, se disponibile
  return reinterpret_cast<jlong>(ctx);
}