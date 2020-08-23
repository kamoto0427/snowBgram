snowboard = Category.create(name: "スノーボード")
snowboard.children.create([
{name: "BURTON"},
{name: "K2"},
{name: "SALOMON"}
])

snowboots = Category.create(name: "ブーツ")
snowboots.children.create([
{name: "BURTON"},
{name: "DEELUXE"},
{name: "FLUX"}
])