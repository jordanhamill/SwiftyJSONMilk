
import Quick
import Nimble

import SwiftyJSON
@testable import SwiftyJSONMilk

class ExampleTest: QuickSpec {
    override func spec() {
        describe("when serializing a github single repository to JSON") {
            let serializer = JSONSerializer()

            beforeEach {
                let owner = GitHubProfile(id: 122094,
                    url: NSURL(string: "https://github.com/jordanhamill")!,
                    login: "jordanhamill",
                    avatarURL: NSURL(string: "https://github.com/jordanhamill/avatar.png")!)

                let repo = GitHubRepository(id: 99345,
                    url: NSURL(string: "https://github.com/jordanhamill/repos/milk")!,
                    owner: owner)

                repo.serialize(serializer)
            }

            it("has the correct repo id") {
                expect(serializer.json["id"].int) == 99345
            }

            it("has the correct repo url") {
                expect(serializer.json["url"].string) == "https://github.com/jordanhamill/repos/milk"
            }

            it("has the correct owner id") {
                expect(serializer.json["owner"]["id"].int) == 122094
            }

            it("has the correct owner url") {
                expect(serializer.json["owner"]["url"].string) == "https://github.com/jordanhamill"
            }

            it("has the correct owner login name") {
                expect(serializer.json["owner"]["login"].string) == "jordanhamill"
            }

            it("has the correct owner avatar url") {
                expect(serializer.json["owner"]["avatar"].string) == "https://github.com/jordanhamill/avatar.png"
            }
        }
    }
}
