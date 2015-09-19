
import Quick
import Nimble

import SwiftyJSON
@testable import SwiftyJSONMilk

class CollectionSerializationSpec: QuickSpec {
    override func spec() {
        describe("serialize(values:[T])") {
            let serializer = JSONSerializer()

            beforeEach {
                let profile = GitHubProfile(id: 122094,
                    url: NSURL(string: "https://github.com/jordanhamill")!,
                    login: "jordanhamill",
                    avatarURL: NSURL(string: "https://github.com/jordanhamill/avatar.png")!)

                let profiles: [GitHubProfile] = Array(count: 3, repeatedValue: profile)

                serializer.serialize(profiles)
            }

            it("has 3 values") {
                expect(serializer.json.array).to(haveCount(3))
            }

            it("has the correct profile id for the first element") {
                expect(serializer.json.array?.first?["id"]) == 122094
            }

            it("has the correct profile id for the second element") {
                expect(serializer.json.array?[1]["id"]) == 122094
            }

            it("has the correct profile id for the first element") {
                expect(serializer.json.array?.last?["id"]) == 122094
            }

            it("has the correct profile url for the first element") {
                expect(serializer.json.array?.first?["url"]) == "https://github.com/jordanhamill"
            }

            it("has the correct profile url for the second element") {
                expect(serializer.json.array?[1]["url"]) == "https://github.com/jordanhamill"
            }

            it("has the correct profile url for the first element") {
                expect(serializer.json.array?.last?["url"]) == "https://github.com/jordanhamill"
            }

            it("has the correct profile login for the first element") {
                expect(serializer.json.array?.first?["login"]) == "jordanhamill"
            }

            it("has the correct profile login for the second element") {
                expect(serializer.json.array?[1]["login"]) == "jordanhamill"
            }

            it("has the correct profile login for the first element") {
                expect(serializer.json.array?.last?["login"]) == "jordanhamill"
            }
        }

        describe("serialize(values:[T], forKeyPath)") {
            let serializer = JSONSerializer()

            beforeEach {
                let profile = GitHubProfile(id: 122094,
                    url: NSURL(string: "https://github.com/jordanhamill")!,
                    login: "jordanhamill",
                    avatarURL: NSURL(string: "https://github.com/jordanhamill/avatar.png")!)

                let profiles: [GitHubProfile] = Array(count: 3, repeatedValue: profile)

                serializer.serialize(profiles, forKeyPath: "profiles")
            }

            it("has 3 values for 'profiles'") {
                expect(serializer.json["profiles"].array).to(haveCount(3))
            }

            it("has the correct profile id for the first element") {
                expect(serializer.json["profiles"].array?.first?["id"]) == 122094
            }

            it("has the correct profile id for the second element") {
                expect(serializer.json["profiles"].array?[1]["id"]) == 122094
            }

            it("has the correct profile id for the third element") {
                expect(serializer.json["profiles"].array?.last?["id"]) == 122094
            }

            it("has the correct profile url for the first element") {
                expect(serializer.json["profiles"].array?.first?["url"]) == "https://github.com/jordanhamill"
            }

            it("has the correct profile url for the second element") {
                expect(serializer.json["profiles"].array?[1]["url"]) == "https://github.com/jordanhamill"
            }

            it("has the correct profile url for the third element") {
                expect(serializer.json["profiles"].array?.last?["url"]) == "https://github.com/jordanhamill"
            }

            it("has the correct profile login for the first element") {
                expect(serializer.json["profiles"].array?.first?["login"]) == "jordanhamill"
            }

            it("has the correct profile login for the second element") {
                expect(serializer.json["profiles"].array?[1]["login"]) == "jordanhamill"
            }

            it("has the correct profile login for the third element") {
                expect(serializer.json["profiles"].array?.last?["login"]) == "jordanhamill"
            }
        }

        describe("deserializeValue() -> [T]?") {
            var deserializedProfiles: [GitHubProfile]?
            beforeEach {
                let profile = GitHubProfile(id: 122094,
                    url: NSURL(string: "https://github.com/jordanhamill")!,
                    login: "jordanhamill",
                    avatarURL: NSURL(string: "https://github.com/jordanhamill/avatar.png")!)

                let profiles: [GitHubProfile] = Array(count: 3, repeatedValue: profile)

                let serializer = JSONSerializer()
                serializer.serialize(profiles)

                let deserializer = JSONSerializer(json: serializer.json)
                deserializedProfiles = deserializer.deserializeValue()
            }

            it("deserializes 3 values") {
                expect(deserializedProfiles).to(haveCount(3))
            }

            it("deserializes the first profile with the correct id") {
                expect(deserializedProfiles?.first?.id) == 122094
            }

            it("deserializes the second profile with the correct id") {
                expect(deserializedProfiles?[1].id) == 122094
            }

            it("deserializes the third profile with the correct id") {
                expect(deserializedProfiles?.last?.id) == 122094
            }
        }

        describe("deserializeValueForKeyPath() -> [T]?") {
            var deserializedProfiles: [GitHubProfile]?
            beforeEach {
                let profile = GitHubProfile(id: 122094,
                    url: NSURL(string: "https://github.com/jordanhamill")!,
                    login: "jordanhamill",
                    avatarURL: NSURL(string: "https://github.com/jordanhamill/avatar.png")!)

                let profiles: [GitHubProfile] = Array(count: 3, repeatedValue: profile)

                let serializer = JSONSerializer()
                serializer.serialize(profiles, forKeyPath: "profiles")

                let deserializer = JSONSerializer(json: serializer.json)
                deserializedProfiles = deserializer.deserializeValueForKeyPath("profiles")
            }

            it("deserializes 3 values") {
                expect(deserializedProfiles).to(haveCount(3))
            }

            it("deserializes the first profile with the correct id") {
                expect(deserializedProfiles?.first?.id) == 122094
            }

            it("deserializes the second profile with the correct id") {
                expect(deserializedProfiles?[1].id) == 122094
            }

            it("deserializes the third profile with the correct id") {
                expect(deserializedProfiles?.last?.id) == 122094
            }
        }
    }
}
