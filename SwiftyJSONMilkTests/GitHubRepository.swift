import Foundation
import Milk

struct GitHubRepository {
    let id: Int
    let url: NSURL
    let owner: GitHubProfile
}

extension GitHubRepository: Serializable {
    func serialize(serializer: Serializer) {
        serializer["id"] <- id
        serializer["url"] <- url.absoluteString
        serializer["owner"] <- owner
    }

    static func deserialize(deserializer: Serializer) -> GitHubRepository? {
        return GitHubRepository(id: <-deserializer["id"],
            url: <-deserializer["url"],
            owner: <-deserializer["owner"])
    }

    private init?(id: Int?, url: String?, owner: GitHubProfile?) {
        if let id = id,
            urlString = url, url = NSURL(string: urlString),
            owner = owner {
                self.id = id
                self.url = url
                self.owner = owner
        } else {
            return nil
        }
    }
}
