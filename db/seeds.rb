snowboard = Category.create(name: "スノーボード")
snowboard_1 = snowboard.children.create([
  {name: "BURTON"},
  {name: "K2"},
  {name: "SALOMON"}])

snowboots = Category.create(name: "ブーツ")
snowboots_1 = snowboots.children.create([
  {name: "BURTON"},
  {name: "DEELUXE"},
  {name: "FLUX"}])