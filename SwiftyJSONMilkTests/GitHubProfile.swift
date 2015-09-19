import Foundation
import Milk

struct GitHubProfile {
    let id: Int
    let url: NSURL
    let login: String
    let avatarURL: NSURL
}

extension GitHubProfile: Serializable {
    func serialize(serializer: Serializer) {
        serializer["id"] <- id
        serializer["url"] <- url.absoluteString
        serializer["login"] <- login
        serializer["avatar"] <- avatarURL.absoluteString
    }

    static func deserialize(deserializer: Serializer) -> GitHubProfile? {
        return GitHubProfile(id: <-deserializer["id"],
                             url: <-deserializer["url"],
                             login: <-deserializer["login"],
                             avatarURL: <-deserializer["avatar"])
    }

    private init?(id: Int?, url: String?, login: String?, avatarURL: String?) {
        if let id = id,
            urlString = url, url = NSURL(string: urlString),
            login = login,
            avatarURLString = avatarURL, avatarURL = NSURL(string: avatarURLString) {
                self.id = id
                self.url = url
                self.login = login
                self.avatarURL = avatarURL
        } else {
            return nil
        }
    }
}
