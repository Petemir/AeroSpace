public struct ListAppsCmdArgs: CmdArgs {
    public let rawArgs: EquatableNoop<[String]>
    public init(rawArgs: [String]) { self.rawArgs = .init(rawArgs) }
    public static let parser: CmdParser<Self> = cmdParser(
        kind: .listApps,
        allowInConfig: false,
        help: """
            USAGE: list-apps [-h|--help] [--macos-native-hidden [no]] [--format <output-format>]

            OPTIONS:
              -h, --help                  Print help
              --macos-native-hidden [no]  Filter results to only print hidden applications.
                                          [no] inverts the condition
              --format <output-format>    Specify output format
            """,
        options: [
            "--macos-native-hidden": boolFlag(\.macosHidden),
            "--format": ArgParser(\.format, parseFormat),
        ],
        arguments: []
    )

    public var windowId: UInt32?
    public var workspaceName: String?
    public var macosHidden: Bool?
    public var format: [StringInterToken] = [
        .value("app-pid"), .value("right-padding"), .literal(" | "),
        .value("app-bundle-id"), .value("right-padding"), .literal(" | "),
        .value("app-name"),
    ]
}
