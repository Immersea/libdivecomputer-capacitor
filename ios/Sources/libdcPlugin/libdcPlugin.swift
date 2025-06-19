import Capacitor

@objc(LibDiveComputerPlugin)
public class LibDiveComputerPlugin: CAPPlugin {
    private let wrapper = LibDiveComputerWrapper()

    @objc func createContext(_ call: CAPPluginCall) {
        let ctxNumber = wrapper.createContext()
        call.resolve([
            "ctxPtr": ctxNumber.uint64Value
        ])
    }

    // Add other @objc methods as needed, e.g.:
    // @objc func openDevice(_ call: CAPPluginCall) { … }
    // @objc func downloadData(_ call: CAPPluginCall) { … }
}
