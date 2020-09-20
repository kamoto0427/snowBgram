@snowboard = Category.create(name: "ボード")
snowboard_brand = ["BURTON", "K2", "SALOMON", "FLOW", "OGASAKA", "RIDE", "ROME", "ALLIAN", "YONEX", "CAPiTA", "NOVEMBER", "elan", "Artistic", "BC Stream", "others1"]

snowboard_brand.each do |snowboard|
  @snowboard.children.create(name:"#{snowboard}")
end

@snowboots = Category.create(name: "ブーツ")
snowboots_brand = ["BURTON", "DEELUXE", "FLUX", "FLOW", "thirtytwo", "K2", "SALOMON", "NIDECKER", "RIDE", "head", "ROME SDS", "YONEX", "adidas", "VANS", "DC", "others2"]

snowboots_brand.each do |snowboots|
  @snowboots.children.create(name:"#{snowboots}")
end

@binding = Category.create(name: "ビンディング")
binding_brand = ["BURTON", "UNION", "FLUX", "SALOMON", "FLOW", "RIDE", "FIX", "BENT METAL", "SP", "K2", "F2", "head", "ROME", "YONEX", "elan", "kissmark", "others3"]

binding_brand.each do |binding|
  @binding.children.create(name:"#{binding}")
end

@helmet = Category.create(name: "ヘルメット")
helmet_brand = ["SALOMON", "GIRO", "SWANS", "BURTON", "SMITH", "K2", "uvex", "Anon", "Sandbox", "BERN", "MOON", "ALPINA", "kufun", "PONTAPES", "Topki", "KASK", "others4"]

helmet_brand.each do |helmet|
  @helmet.children.create(name:"#{helmet}")
end

@goggle = Category.create(name: "ゴーグル")
goggle_brand = ["DRAGON", "OAKLEY", "SMITH", "SWANS", "ELECTRIC", "anon", "bern","SALOMON", "K2", "uvex", "SPY", "DICE", "VONZIPPER", "REVOLT", "POC", "ASHBURY", "GIRO", "D:RECT", "ABOM", "others5"]

goggle_brand.each do |goggle|
  @goggle.children.create(name:"#{goggle}")
end

@grove = Category.create(name: "グローブ")
grove_brand = ["BURTON", "VOLCOM", "SALOMON", "DAKINE", "neff", "eb’s", "oran’ge", "VOLUME", "ROXY", "GRENADE", "3 REE", "kissmark", "Ashram", "DC", "others6"]

grove_brand.each do |grove|
  @grove.children.create(name:"#{grove}")
end

@wear = Category.create(name: "ウェア")
wear_brand = ["BURTON", "VOLCOM", "Analog", "686", "REW", "BILLABONG", "THE NORTH FACE", "ARBN", "HOLDEN", "neff", "othes7"]

wear_brand.each do |wear|
  @wear.children.create(name:"#{wear}")
end

@item = Category.create(name: "アイテム")
item_brand = [ "BURTON"]

item_brand.each do |item|
  @item.children.create(name:"#{item}")
end