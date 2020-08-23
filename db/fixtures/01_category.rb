parents = %w[ スノーボード ブーツ ビンディング ]
snowboard_child = %w[ BURTON K2 SALOMON ]
snowboots_child = %w[ BURTON DEELUXE FLUX ]
binding_child = %w[ BURTON UNION FLUX ]

parents.each do |parent|
  Category.seed do |c|
    c.name = parent
  end
end

snowboard_child.each do |child|
  Category.find_by!(name: 'スノーボード').children.create(name: child)
end

snowboots_child.each do |child|
  Category.find_by!(name: 'ブーツ').children.create(name: child)
end

binding_child.each do |child|
  Category.find_by!(name: 'ビンディング').children.create(name: child)
end



