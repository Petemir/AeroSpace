public struct FlattenWorkspaceTreeCmdArgs: CmdArgs {
    public let rawArgs: EquatableNoop<[String]>
    public init(rawArgs: [String]) { self.rawArgs = .init(rawArgs) }
    public static let parser: CmdParser<Self> = noArgsParser(.flattenWorkspaceTree, allowInConfig: true)

    public var windowId: UInt32?
    public var workspaceName: String?
}
