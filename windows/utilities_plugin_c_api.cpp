#include "include/utilities/utilities_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "utilities_plugin.h"

void UtilitiesPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  utilities::UtilitiesPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
