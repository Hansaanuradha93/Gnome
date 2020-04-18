import Foundation

enum FileType: String {
    case mp3 = "mp3"
    case aac = "aac"
    case wmv = "wmv"
}

struct File {
    let name: String
    let type: FileType.RawValue
}

