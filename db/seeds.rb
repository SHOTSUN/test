(1..100).each do |i|
  Product.create!(name: "Lipsum Post #{i}", link: "link", image: "image", price: "123456789")
end