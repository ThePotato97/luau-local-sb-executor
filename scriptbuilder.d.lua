declare owner: Player
declare function printf(...: any): ()
declare function warnf(...: any): ()

type RbxUtilityConnection = {
	disconnect: (self: RbxUtilityConnection) -> (),
	Disconnect: (self: RbxUtilityConnection) -> (),
}
type RbxUtilitySignalConnect = (self: RbxUtilitySignal, f: (...any) -> ...any) -> RbxUtilityConnection
type RbxUtilitySignalDisconnect = (self: RbxUtilitySignal) -> ()
type RbxUtilitySignalWait = (self: RbxUtilitySignal) -> ...any
type RbxUtilitySignalFire = (self: RbxUtilitySignal, ...any) -> ()

type RbxUtilitySignal = {
	connect: RbxUtilitySignalConnect,
	Connect: RbxUtilitySignalConnect,
	disconnect: RbxUtilitySignalDisconnect,
	Disconnect: RbxUtilitySignalDisconnect,
	wait: RbxUtilitySignalWait,
	Wait: RbxUtilitySignalWait,
	fire: RbxUtilitySignalFire,
	Fire: RbxUtilitySignalFire,
}

type RbxUtility = {
	Create: (className: string) -> (args: { [any]: any }?) -> Instance,
	CreateSignal: () -> RbxUtilitySignal,
	DecodeJSON: (encoded: string) -> any,
	EncodeJSON: (data: any) -> string,
	Help: (input: ((...any) -> ...any) | string) -> string?,
	-- MakeWedge doesn't work (old terrain)
	-- SelectTerrainRegion ignored
}
type LoadLibrary = (
	("RbxGui") -> any -- TODO
) & (
	("RbxStamper") -> any -- TODO
) & (
	("RbxUtility") -> RbxUtility
)
declare LoadLibrary: LoadLibrary

declare function LoadModel(name: string): Instance

type AssetLoader = {
	Get: (asset: string) -> Instance,
    Exists: (asset: string) -> Instance,
    GetNames: () -> { string },
    GetArray: () -> { Instance },
    GetDictionary: () -> { [string]: Instance }
}
declare function LoadAssets(id: number): AssetLoader 

type NewScript = (source: string, parent: Instance?, ...any) -> Script
declare NewScript: NewScript
declare NS: NewScript

type NewLocalScript = (source: string, parent: Instance?, ...any) -> LocalScript
declare NewLocalScript: NewLocalScript
declare NLS: NewLocalScript
