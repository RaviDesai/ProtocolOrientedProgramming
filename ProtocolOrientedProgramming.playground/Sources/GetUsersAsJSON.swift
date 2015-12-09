import Foundation

public func GetUsersAsJSON() -> JSONArray {
    let jsonString = "[{\"name\": \"Adama\", \"rank\": \"General\", \"serial\": \"1\"}, {\"name\": \"Starbuck\", \"rank\": \"Captain\", \"serial\": \"2\"}, {\"name\": \"Roslin\", \"rank\": \"President\", \"serial\": \"3\"}]";
    let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding)!
    let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
    return json as! JSONArray
}
