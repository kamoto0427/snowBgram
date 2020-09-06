crumb :root do
  link "ホーム画面", root_path
end

crumb :users do
  link "snowBユーザー", users_path, method: :get
end

crumb :mypage do
  link "#{current_user.name}のマイページ", user_path, method: :get
  parent :users
end

crumb :mypage_edit do
  link "マイページの編集", edit_user_path
  parent :mypage
end